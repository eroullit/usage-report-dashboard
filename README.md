# actions-workflow-dashboard

> Dashboard implementation to display GitHub Actions usage statistics of an enterprise or a specific organization based on its usage report.

This tool will directly expose an SQL interface to the user, meaning the user is free to query, manipulate and refine data on its Actions usage.
Its usage is purely offline. It neither requires data to be sent to a third party nor does it use API calls to GitHub.

## Installation

Install the project dependencies:

```bash
$ brew install datasette sqlite-utils
$ datasette install datasette-dashboards
```

## Usage

Once you have fetched your [Usage Report CSV file](https://docs.github.com/en/enterprise-cloud%2540latest/billing/managing-billing-for-github-actions/viewing-your-github-actions-usage#viewing-github-actions-usage-for-your-enterprise-account), the `usage-report2sql.sh` can be used to convert it to a SQLite database called `usage.db`:

```bash
$ ./usage-report2sql.sh usage-report.csv
```

Then, you can start the dashboard:

```bash
$ datasette usage.db --metadata metadata.yml
```

Large data sets might return more rows than the default value. It can be increase by starting it with:

```bash
$ datasette usage.db --metadata metadata.yml --setting max_returned_rows 200000
```

Once stated, the raw data is available locally at [http://127.0.0.1:8001](http://127.0.0.1:8001/) where as the charts can be displayed at [http://localhost:8001/-/dashboards/](http://localhost:8001/-/dashboards/)

## Modifications

If you want to modify the dashboard, you can edit the [`metadata.yml`](./metadata.yml) file and add your own charts.