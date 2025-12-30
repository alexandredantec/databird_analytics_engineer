<!-- List of the fields created in this model to be referenced further downstream -->
<!-- Fields should only be listed here if they first appear in this model -->

{% docs stg_local_bikes__stocks__stock_id %}
Unique identifier for each stock record, created by concatenating store_id and product_id
{% enddocs %}

{% docs stg_local_bikes__stocks__store_id %}
Identifier for the store
{% enddocs %}

{% docs stg_local_bikes__stocks__product_id %}
Identifier for the product
{% enddocs %}

{% docs stg_local_bikes__stocks__quantity %}
Quantity of the product in stock at the store (defaults to 0 if null)
{% enddocs %}