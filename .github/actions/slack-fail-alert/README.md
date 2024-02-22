# Slack Fail Alert 

This action sends a failure message to Slack.

## Example Usage

```yaml
    steps:
      - name: Send slack failure alert
        uses: ./.github/actions/slack-fail-alert
        if: ${{ failure() && github.event_name != 'workflow_dispatch' }}
```


