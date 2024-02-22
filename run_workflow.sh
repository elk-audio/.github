#!/bin/bash

run_workflow() {
    echo "Running GitHub workflow $name"
    gh workflow run "$name"
}

fetch_results() {
    echo "Fetching results... $1 $2"
    local web="$1"
    local run_id="$2"
    # if open_browser
    if [[ $web -eq 1 ]]; then
      echo "Opening: https://github.com/elk-audio/.github/actions/runs/$run_id"
      gh run view "$run_id" --web
    else
      gh run view "$run_id" --log
    fi
}

web=0
if [[ "$1" == "--web" ]] || [[ "$2" == "--web" ]]; then
  echo "Opening on Web Browser"
  web=1
fi

name="$1"
if [[ -z "$1" ]] || [[ "$1" == "--web" ]]; then
  echo "Select a workflow"
  name="$(gh workflow list --json path --jq '.[] | .path' | fzf)" 
  if [ -z "$name" ]; then
    echo "No workflow selected"
    exit 1
  fi
fi

run_workflow $name

echo "Waiting for the workflow to start..."
status=""
run_id=""
while [[ "$status" != "completed" ]]; do
    sleep 5
    run_id=$(gh workflow view $name | sed -n '6 p'| awk '{print $NF}')
    echo "Waiting for the run $run_id to complete..."
    status=$(gh run view "$run_id" --json status | jq -r '.status')
done
echo "Workflow completed!"
echo "Run id: $run_id" 

fetch_results "$web" "$run_id" 
