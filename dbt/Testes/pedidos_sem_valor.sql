select
    id_pedido,
    id_item,
    valor_total_item
from {{ ref('fato_vendas') }}
where valor_total_item is null
   or valor_total_item <= 0