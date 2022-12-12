# Municipes

Controle de cadastro de Municipes com endereço.

## Descrição

Cadastro para Municipes com registro de endereço, busca por CEP e inserção de imagem.

## Feito com
![Rails][Rails]![Elasticsearch][Elasticsearch]![Docker][Docker]![PostgreSQL][PostgreSQL]![Sidekiq][Sidekiq]![Redis][Redis]

## Passos iniciais

### Dependências

* Docker

### Instalação

* Docker
* docker-compose

### Executando aplicação

```
./start.sh
```

### Executando testes

```
./rspec.sh
```

### Links

* Aplicação http://localhost:3000
* Sidekiq http://localhost:3000/sidekiq
* MailCatcher http://localhost:1080
* Aplicação Produção https://nameless-wildflower-9670.fly.dev/


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

[Rails]: https://img.shields.io/badge/Rails-a40000?style=for-the-badge&logo=RubyonRails&logoColor=white
[Elasticsearch]: https://img.shields.io/badge/Elasticsearch-3AB8AB?style=for-the-badge&logo=Elasticsearch&logoColor=white
[Docker]: https://img.shields.io/badge/Docker-0092E6?style=for-the-badge&logo=Docker&logoColor=white
[PostgreSQL]: https://img.shields.io/badge/PostgreSQL-2F6792?style=for-the-badge&logo=PostgreSQL&logoColor=white
[Sidekiq]: https://img.shields.io/badge/Sidekiq-F7F7F7?style=for-the-badge&logo=Sidekiq&logoColor=white
[Redis]: https://img.shields.io/badge/Redis-D12B1F?style=for-the-badge&logo=Redis&logoColor=white