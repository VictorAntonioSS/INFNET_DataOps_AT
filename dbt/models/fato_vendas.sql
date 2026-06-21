select
    cast(i.id_item as integer) as id_item,
    cast(i.id_pedido as integer) as id_pedido,
    cast(p.id_cliente as integer) as id_cliente,
    cast(i.id_produto as integer) as id_produto,
    cast(i.quantidade as integer) as quantidade,
    cast(i.valor_unitario as double) as valor_unitario,
    cast(i.valor_total_item as double) as valor_total_item,
    cast(p.data_pedido as date) as data_pedido
from {{ source('silver', 'itens_pedido') }} i
left join {{ source('silver', 'pedidos') }} p
    on cast(i.id_pedido as integer) = cast(p.id_pedido as integer)