select
    id_cliente,
    nome,
    email
from {{ ref('dim_cliente') }}
where email is null
   or trim(email) = ''