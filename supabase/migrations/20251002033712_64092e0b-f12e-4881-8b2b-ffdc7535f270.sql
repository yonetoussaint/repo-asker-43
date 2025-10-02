-- Insert sample data for testing counters (for user with existing wishlist data)
-- Cart items
INSERT INTO cart (user_id, product_id, quantity) 
SELECT 
  '6a01fb2e-9c7b-45b4-ab7f-9e2c058f54f3',
  id,
  2
FROM products 
WHERE id IN (
  SELECT product_id FROM wishlist WHERE user_id = '6a01fb2e-9c7b-45b4-ab7f-9e2c058f54f3' LIMIT 2
)
ON CONFLICT DO NOTHING;

-- Notifications
INSERT INTO notifications (user_id, title, message, type, is_read)
VALUES
  ('6a01fb2e-9c7b-45b4-ab7f-9e2c058f54f3', 'New Offer', 'Check out our latest deals!', 'promo', false),
  ('6a01fb2e-9c7b-45b4-ab7f-9e2c058f54f3', 'Order Shipped', 'Your order has been shipped', 'order', false),
  ('6a01fb2e-9c7b-45b4-ab7f-9e2c058f54f3', 'Welcome', 'Welcome to our store!', 'info', false)
ON CONFLICT DO NOTHING;

-- User addresses
INSERT INTO user_addresses (user_id, title, address_line1, city, state, zip_code, country)
VALUES
  ('6a01fb2e-9c7b-45b4-ab7f-9e2c058f54f3', 'Home', '123 Main St', 'New York', 'NY', '10001', 'US'),
  ('6a01fb2e-9c7b-45b4-ab7f-9e2c058f54f3', 'Work', '456 Office Blvd', 'Brooklyn', 'NY', '11201', 'US')
ON CONFLICT DO NOTHING;

-- Help tickets
INSERT INTO help_tickets (user_id, subject, message, status)
VALUES
  ('6a01fb2e-9c7b-45b4-ab7f-9e2c058f54f3', 'Delivery Question', 'When will my order arrive?', 'open'),
  ('6a01fb2e-9c7b-45b4-ab7f-9e2c058f54f3', 'Product Issue', 'Product not as described', 'open')
ON CONFLICT DO NOTHING;