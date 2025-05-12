EXPLAIN ANALYZE
SELECT o.date_created, SUM(op.quantity)
FROM public.orders AS o
JOIN public.order_product AS op ON o.id = op.order_id
WHERE o.status = 'shipped' AND o.date_created > NOW() - INTERVAL '7 DAY'
GROUP BY o.date_created;

CREATE INDEX IF NOT EXISTS idx_orders_status_date_created 
ON public.orders (status, date_created);

CREATE INDEX IF NOT EXISTS idx_order_product_order_id 
ON public.order_product (order_id);

EXPLAIN ANALYZE
SELECT o.date_created, SUM(op.quantity)
FROM public.orders AS o
JOIN public.order_product AS op ON o.id = op.order_id
WHERE o.status = 'shipped' AND o.date_created > NOW() - INTERVAL '7 DAY'
GROUP BY o.date_created;
