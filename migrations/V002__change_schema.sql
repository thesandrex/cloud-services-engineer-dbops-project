ALTER TABLE public.product
ADD COLUMN price double precision;

ALTER TABLE public.orders
ADD COLUMN date_created date DEFAULT CURRENT_DATE;

DROP TABLE IF EXISTS public.orders_date;
DROP TABLE IF EXISTS public.product_info;

ALTER TABLE public.order_product
ADD CONSTRAINT fk_order
FOREIGN KEY (order_id) REFERENCES public.orders(id)
ON DELETE CASCADE;

ALTER TABLE public.order_product
ADD CONSTRAINT fk_product
FOREIGN KEY (product_id) REFERENCES public.product(id)
ON DELETE CASCADE;

CREATE UNIQUE INDEX IF NOT EXISTS idx_order_product ON public.order_product (order_id, product_id);
