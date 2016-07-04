[![Code Climate](https://codeclimate.com/github/nathanpsouza/avaliacao_desenvolvedor/badges/gpa.svg)](https://codeclimate.com/github/nathanpsouza/avaliacao_desenvolvedor)
[![CircleCI](https://circleci.com/gh/nathanpsouza/avaliacao_desenvolvedor.svg?style=svg)](https://circleci.com/gh/nathanpsouza/avaliacao_desenvolvedor)

# Teste Nama

## Dependências

* Ruby 2.3.1
* Sqlite3
* PhantomJS para executar os testes do RSpec

## Rodando a aplicação

`$ bundle install`

`$ rake db:create db:migrate`

`$ rails s`

## Considerações

rode a suíte de testes com:

`$ bundle exec rspec spec`