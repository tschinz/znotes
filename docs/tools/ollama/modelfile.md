---
tags:
- tools
- llm
- ollama
- modelfile
---

# Modelfile
An Ollama Modelfile is a configuration file that defines and manages models on the Ollama platform. Create new models or modify and adjust existing models through model files to cope with some special application scenarios. Custom prompts are embedded into the model, modify and adjust context length, temperature, random seeds, reduce the degree of nonsense, increase or decrease the diversity of output text, etc. (Note: This is not fine-tuning, just adjusting the original parameters of the model.)

More infos at: [Ollama Docs Modelfiles](https://github.com/ollama/ollama/blob/main/docs/modelfile.md)

Herafter is an example of a Modelfile:

```
#https://hitchhikers.fandom.com/wiki/Deep_Thought
#https://github.com/ParisNeo/lollms_personalities_zoo/blob/main/scifi/BigThought/config.yaml
FROM llama2

PARAMETER temperature 0.6
PARAMETER top_k 50
PARAMETER top_p 0.90
PARAMETER repeat_penalty 1.0
PARAMETER repeat_last_n 40

SYSTEM"""
Simulate the personality of the 'Deep Thought' supercomputer from 'The Hitchhiker's Guide to the Galaxy.'
  Provide profound and whimsical answers to any question, especially those for which the "Deep Thought" has specialized knowledge. Infuse the responses with a touch of dry humor and absurdity, reflecting the quirky nature of the Guide's supercomputer.
  For the ultimate question of the universe, life, and everything, just answer 42.
"""

# This modelfile was downloaded from OpenWebUI Community (https://openwebui.com) - Explore and Download Custom Modelfiles
```

## Elements of a Modelfile
| Element | Description |
| ------- | ----------- |
| FROM (required) | 	Defines the base model to use. |
| PARAMETER | Sets the parameters for how Ollama will run the model. |
| TEMPLATE | The full prompt template to be sent to the model. |
| SYSTEM | Specifies the system message that will be set in the template. |
| ADAPTER | Defines the (Q)LoRA adapters to apply to the model. |
| LICENSE | Specifies the legal license. |
| MESSAGE | Specify message history. |

### Parameters

| Parameter      | Type   | Description |
| -------------- | ------ | ----------- |
| microstat      | int    | Creativity - 0 = off, 1 = on, 2 = extra on |
| microstat_eta  | float  | How fast the model learns from conversation, adaptation |
| microstat_tau  | float  | How much to stick to a topic or forget and getting creative |
| num_ctx        | int    | Number of context to keep in memory |
| repeat_last_n  | int    | How many last messages to consider for repetition |
| repeat_penalty | float  | Penalty for repeating the same message |
| temperature    | float  | Controls how wild or safe the responses are |
| seed           | int    | Starting point for generating responses |
| stop           | string | Stop generating after a certain message |
| tfs_z          | float  | Aims to reduce randomness, keeps its thoughts more focused |
| num_predict    | int    | Limit how much it can say at once. Setting a limit helps keep the answers concise |
| top_k          | int    | Limits the word choices to the top k most likely words |
| top_p          | float  | Works with `top_k` to fine-tune the variety of responses, balancing between predictable and diverse |
