select
    cast(id_produto as integer) as id_produto,
    nome_produto,
    categoria,
    cast(preco as double) as preco
from {{ source('silver', 'produtos') }}