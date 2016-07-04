module Importer
  class Base
    attr_accessor :path

    def initialize path      
      @path = path
    end

    def get_header
      begin
        return File.open(@path, &:readline)
      rescue Exception => e
        return ""
      end
    end

    def valid?
      header = get_header
      return false if header.empty?
      is_header? header
    end

    def is_header? string
      string == "Comprador\tdescrição\tPreço Uniário\tQuantidade\tEndereço\tFornecedor\n"
    end

    def parse line
      columns = line.gsub("\n", "").split("\t")
      raise Exception.new("Invalid line to parse") if columns.size != 6

      {
        customer_name: columns[0], 
        description: columns[1], 
        value: columns[2].to_d, 
        quantity: columns[3].to_i, 
        address: columns[4], 
        provider: columns[5]
      }
    end

    def get_rows
      rows = []
      File.open(@path, "r") do |infile|
        while (line = infile.gets)
          rows << parse(line) unless is_header?(line)
        end
      end

      rows
    end

    def import
      if valid?
        ActiveRecord::Base.transaction do
          get_rows.each do |record|
            order = Order.create(record)
            raise Exception.new("Invalid record") unless order.persisted?
          end
        end
      else
        raise Exception.new("Invalid file")
      end
    end
  end
end