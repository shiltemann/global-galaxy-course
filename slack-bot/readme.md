# Slack Bot

Everything in the scheduled directory will be sent once, after the specific time. It's as easy as composing the json and dumping it in the folder.

## Editing the template

You can use [this page](https://app.slack.com/block-kit-builder/T01EGPWTHFF) to edit and create the custom templates you might want to send.

## Rebuilding the shift-change messages

Since these are relatively automated, you can run `./build.sh` to rebuild the shift-change messages. These are templated out from the [./shift-change-template.json](shift-change-template.json) file (only the header really.) This only needs to be done once really, after that if you want any customisations (e.g. for friday, you can do that in the scheduled directory)
