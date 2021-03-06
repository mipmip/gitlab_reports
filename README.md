# Gitlab Reports

Gitlab reports is a CLI utility that helps you creating reports from gitlab. It
uses yml-confiration files for report configuration and ERB-templates for
creating a report lay-out.

## Features
- configurable reports with yaml
- output to any format using erb-tempates
- simple, no hasle
- works with self-hosted gitab

## Installation

Install the executable with:

    gem install gitlab_reports

Add a new access key in Gitlab. [Check this video how](https://www.youtube.com/watch?v=xqmVBuNWMYY&feature=youtu.be)

Create main config file:

    echo "---" > $HOME/.gitlab_reports.yml
    # Paste your token in de command below
    echo "TOKEN: [YOUR NEW TOKEN]" >> $HOME/.gitlab_reports.yml
    # Enter your local gitlab-url + /api/v4
    echo "ENDPOINT: https://your-gitlab.url/api/v4" >> $HOME/.gitlab_reports.yml

## Usage

Before you can use gitlab_reports, you must first create a report confiration

```
Commands:
  gitlab_report help [COMMAND]                   # Describe available commands or one specific command
  gitlab_report projects                         # print all projects with id and title
  gitlab_report report [report_config_file.yml]  # print report with config
```

Example command:

  gitlab_report report ~/report-all-paying-customers.yml



## Report Configuation

Create a report-confirguration in YAML, save it anywhere you like.

It looks like this:

```yaml
---
title: Betaalde Issues uitvoeren
subtitle: Issues met impacts akkoord per project (uitvoeren)
filename: ~/Desktop/impacts-akkoord.md
columns:
  - iid
  - title
  - assignee
  - labels
project_ids:
  - 556 # comment this is project x, it will be included in the report
  - 555 # this is project y, idem dito
labels_include: feature|bug # seperate labels with | (pipe)
labels_exclude: please\ close|invalid:.* # regex is allowed
template: /path/to/template/issues-per-project.md.erb # html-templates are alow possible
```

Create a report-template as ERB, save it anywhere you like, refer to it in your report-configuration

Here's an example:

```
# <%= @title  %>

<% @proj.each do | prj | %>
## <%=prj['name']%>
<%=prj['issue_table']%>
<% end %>
```

### YAML-fields description

| field          | description                                                | erb var       |
|----------------|------------------------------------------------------------|---------------|
| title          | Report Title                                               | @title        |
| subtitle       | Subtitle                                                   | @subtitle   |
| filename       | output filename                                            |               |
| columns        | columns of issues to include in select query               | keys of @proj |
| project_ids    | numeric id's of projects to include in select select query |               |
| labels_include | issue labels to include in query condition                 |               |
| labels_exclude | issue labels to exclude in query condition                 |               |
| template       | erb-file to use as template                                |               |

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/gitlab_reports. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the GitlabReports project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/gitlab_reports/blob/master/CODE_OF_CONDUCT.md).
