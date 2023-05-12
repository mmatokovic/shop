# Shop

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex.bat -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
  
## License

See [LICENSE](./LICENSE).

# Generate the Product model, migration, and controller
mix phx.gen.html Products Product products name:string description:string price:float image_url:string

# Generate the Order model, migration, and controller
mix phx.gen.html Orders Order orders customer_name:string customer_address:string customer_email:string total:float status:string

# Generate the OrderItem model and migration
mix ecto.gen.migration create_order_items order_id:references:orders product_id:references:products quantity:integer unit_price:float

# Generate the Customer model, migration, and controller
mix phx.gen.html Customers Customer customers first_name:string last_name:string email:string address:string phone:string

# Generate the Payment model and migration
mix ecto.gen.migration create_payments order_id:references:orders status:string amount:float

