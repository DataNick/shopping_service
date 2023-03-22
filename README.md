# Altrio Technical Test

## General
There are five parts to this exercise, with one extension part. You should complete at least the first four tasks.
We recommend spending around 3 hours on this exercise, we're more interested in what you get done than whether you complete the whole exercise.

If you have any questions or concerns, e-mail us.

We’d like you to use Ruby, with tests, to solve the coding parts of the task.

We've shared this code test to you via a GitHub repository, please keep it private. You should check your solution in here, making commits at logical increments, with at least one commit for each part of the exercise - we’re interested in how your solution developed, not just the end result.

Parts 4, 5 and 6 have written components. For the answers to free-text questions, you should check a text file in alongside your code.

## ExampleCo Order Handling
Your company, ExampleCo, conducts a number of transactions both online and over the phone for different items. The current order handling processes across the company involve a combination of manual work and spreadsheets alongside some reports extracted from the online store software.

Two data files are provided, in JSON format:

* `catalog.json` contains the items that customers can order.
* `orders.json` contains 5 customer orders that we want the system to be able to work with.

You’ve been tasked with building a new system to standardize the handling of orders, but the company needs to keep some of the quirks of their particular sales model in the new system.

You may either make this system terminal based or use a web application framework (e.g. Rails). Appearances don’t matter, so you don’t need to spend any time on styling.

### 1. Show all orders and a summary

ExampleCo would like their customer support agents to be able to look at all the orders without having to understand the data file format.

Code Task:  Show the details of of each order,  followed by a summary - with the following information:

```
ORDER 123 (John Smith)
4x Michelin Tyre @ $100.00 ea, $400.00
1x Blue Tree Air Freshener @ $5.00 ea, $5.00
Total: $405.00
—
ORDER xyz..
—
Summary
5 orders
Total $xxx.xx
```

### 2. Allow lookup of a single Order, show summary

ExampleCo would like to be able to look up a single order, when the customer calls in to discuss it.

Code Task: Your program should accept user input of an order ID and show the order output as above, but for the single order requested.

Your program should show an error if the order ID is invalid, so that the operative knows the order ID from the customer is incorrect.

### 3. Loyalty Discounts

Some customers are part of the ExampleCo loyalty program. These customers have their `member_no` included on the order.

These orders should receive 20% off their total spend.

Code Task: Extend the show orders mechanism so that it shows this discount, and reflects it in the total. The overall summary should show this information too.

e.g.

```
…
Total: $100.00 (Loyalty discount: $25.00)
…
```

### 4. Support Quantity-based Promotions

ExampleCo would like the order system to support quantity based promotion on certain items. One such promotion is:

* Buy 3 tyres get 1 free.

Code Task: Extend the system (and example input files) to support and implement this promotion with appropriate output in the order summary to show the discount.

Write-up: In a paragraph or two, summarize some of the design choices you made in modifying the system, and any assumptions present in your solution.

### 5. Support Item-based promotions

Further to the earlier support of quantity based promotions, ExampleCo would also like to put multiple items on sale as one promotion. They have provided an example promotion -

* All three kinds of air freshener are on offer, any combination of 3 of them should be priced at $10

Code Task: Extend the system to support this, as above, with output in the order summary to reflect the new behaviour.

Write-up Task: As above, summarize your design choices and any assumptions you made along the way.

### 6. Inventory & Reporting

Write-up Task: Describe how you would extend the system to support keeping inventory, processing orders against it and being able to report the total value of the inventory in stock, including any promotional discounts applied.

* How would you maintain item quantity information?
* How would you process the orders against inventory?

Code Task: Modify the system to support this functionality.
