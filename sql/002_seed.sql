INSERT INTO orders (
    customer_id,
    status,
    country,
    amount,
    description,
    created_at,
    email
)
SELECT
    floor(random() * 100000)::BIGINT,

    (ARRAY[
        'pending',
        'paid',
        'shipped',
        'delivered',
        'cancelled'
    ])[floor(random() * 5 + 1)::INT],

    (ARRAY[
        'BR', 'US', 'AR', 'CL', 'MX',
        'CO', 'PT', 'ES', 'DE', 'FR'
    ])[floor(random() * 10 + 1)::INT],

    round((random() * 10000)::numeric, 2),

    md5(random()::text) ||
    md5(random()::text) ||
    md5(random()::text),

    NOW() - (random() * INTERVAL '3 years'),

    'user_' ||
    floor(random() * 1000000)::BIGINT ||
    '@example.com'

FROM generate_series(1, 1000000);
