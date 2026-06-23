{{ config(materialized='table') }}

with itens as (
    select distinct
        cast(id_item as integer) as id_item,
        cast(id_pedido as integer) as id_pedido,
        cast(id_produto as integer) as id_produto,
        cast(quantidade as integer) as quantidade,
        cast(valor_unitario as double) as valor_unitario,
        cast(valor_total_item as double) as valor_total_item
    from {{ source('silver', 'itens_pedido') }}
),

pedidos as (
    select
        cast(id_pedido as integer) as id_pedido,
        max(cast(id_cliente as integer)) as id_cliente,
        max(cast(data_pedido as date)) as data_pedido
    from {{ source('silver', 'pedidos') }}
    group by cast(id_pedido as integer)
),

clientes as (
    select
        id_cliente,
        max(cpf) as cpf
    from {{ ref('dim_cliente') }}
    group by id_cliente
),

produtos as (
    select
        id_produto,
        max(nome_produto) as nome_produto
    from {{ ref('dim_produto') }}
    group by id_produto
)

select
    i.id_item,
    i.id_pedido,
    p.id_cliente,
    i.id_produto,
    pr.nome_produto,
    i.quantidade,
    i.valor_unitario,
    i.valor_total_item,
    p.data_pedido,
    c.cpf

from itens i

left join pedidos p
    on i.id_pedido = p.id_pedido

left join clientes c
    on p.id_cliente = c.id_cliente

left join produtos pr
    on i.id_produto = pr.id_produto