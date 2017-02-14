# rubocop_plugin_render Step
Render for rubocop result

### INPUTS

* `FLOW_RUBOCOP_LOG_PATH` - rubocop path.

## EXAMPLE 

```yml
steps:
  - name: rubocop_plugin_render
    enable: true
    failure: true
    plugin:
      name: rubocop_plugin_render
      inputs:
        - FLOW_RUBOCOP_LOG_PATH=$FLOW_RUBOCOP_LOG_PATH
```
