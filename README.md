# How it runs?

- Ruby version 3.1.2
- Rails 7.0.3
- PostgreSQL 14.4

Data seeded with CSV files.

# Solutions
- I added a new column to calculate the fee on save when the Order is created.
- I chose to create a disbursements table that would update every monday, the data that was provided before was seeded with a query.
- The job would run every monday by creating a job in the crontab with the help of the `whenever` gem.
- The disbursements API is on the route `/disbursements` and receives two params `date` and `merchant_id`. The `date` parameter is used to compare a the range of disbursement which is a week.

# What I couldn't do
- I wanted to add a join table between disbursements and orders so orders already disbursed would't be included in multiple disbursements.
- There's no API documentation.
- There's no authentication/authorization.
