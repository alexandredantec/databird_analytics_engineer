<!-- List of the fields created in this model to be referenced further downstream -->
<!-- Fields should only be listed here if they first appear in this model -->

{% docs int_local_bikes__customer_price %}
Price paid by customer per unit after discount (list_price - discount)
{% enddocs %}

{% docs int_local_bikes__total_price %}
Total price for the order item before discount (list_price * quantity)
{% enddocs %}

{% docs int_local_bikes__total_customer_price %}
Total price paid by customer for the order item after discount ((list_price - discount) * quantity)
{% enddocs %}