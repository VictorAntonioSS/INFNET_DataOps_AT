select
    cast(id_cliente as integer) as id_cliente,
    nome,
    email,
    cpf,
    cidade
from {{ source('silver', 'clientes') }}