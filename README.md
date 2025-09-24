# Projeto Login com RSpec e FactoryBot

## Desenvolvido por
**Sibelly Araújo**

## Descrição
Sistema de login em Rails que diferencia usuários comuns e administradores.  
Admins têm acesso à área de administração; usuários comuns são redirecionados para a página principal caso tentem acessar a área de admin.

## Tecnologias
- Ruby on Rails 
- Devise (autenticação e gerenciamento de usuários)  
- RSpec + FactoryBot (testes automatizados)  

## Funcionalidades
- Registro e login de usuários com roles diferentes: admin e usuário comum.  
- Área administrativa protegida apenas para admins.  
- Redirecionamento automático de usuários comuns que tentarem acessar a área admin.  
- Testes automatizados cobrindo controllers e requests.  
