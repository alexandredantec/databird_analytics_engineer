<!-- List of the fields created in this model to be referenced further downstream -->
<!-- Fields should only be listed here if they first appear in this model -->

{% docs stg_local_bikes__order_items__order_item_id %}
Unique identifier for each order item, created by concatenating order_id and item_id
{% enddocs %}

{% docs stg_local_bikes__order_items__order_id %}
Identifier for the order
{% enddocs %}

{% docs stg_local_bikes__order_items__item_id %}
Item number within the order
{% enddocs %}

{% docs stg_local_bikes__order_items__product_id %}
Identifier for the product
{% enddocs %}

{% docs stg_local_bikes__order_items__quantity %}
Quantity of the product ordered (defaults to 0 if null)
{% enddocs %}

{% docs stg_local_bikes__order_items__list_price %}
List price of the product (defaults to 0 if null)
{% enddocs %}

{% docs stg_local_bikes__order_items__discount %}
Discount applied to the product (defaults to 0 if null)
{% enddocs %}