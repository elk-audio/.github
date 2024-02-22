# Elk Dynamic Input Defaults

Merges inputs provided as a JSON key-value object with defaults provided as a
JSON key-value object. The result is a JSON key-value object with the defaults
overriden by the inputs.

This is useful to not have to propagate defaults through the chain of composite
actions, while still being able to override the parameters.

The parameters then can be decoded with the `fromJson` function that 
github provides.

Example use, a simplified version of: `elk-aws-login`

```yaml
    steps:
      - name: test-dynamic-input-defaults
        uses: elk-audio/.github/.github/actions/elk-dynamic-input-defaults@v1
        id: defaults
        with: 
          input: '{"my": "WOOOO", "are": "dynamic"}'
          defaults: '{"my": "2", "input": "3", "are": "4"}'
      - name: Use the parameters  
        run: |
          echo "${{ steps.defaults.outputs.merged }}"
          echo "${{ fromJson(steps.defaults.outputs.merged).my }}"
          echo "${{ fromJson(steps.defaults.outputs.merged).input }}"
          echo "${{ fromJson(steps.defaults.outputs.merged).are }}"
```

