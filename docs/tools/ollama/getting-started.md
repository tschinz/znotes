---
tags:
- tools
- llm
- ollama
---

# Getting Started

## Installing Ollama
Goto to the official Website of [Ollama](https://ollama.com/download) and download the latest version.

## Ollama CLI

Once the tool is installed you have to use the terminal to use the ollama cli. It allows to download and run models.

```bash
ollama
Usage:
  ollama [flags]
  ollama [command]

Available Commands:
  serve       Start ollama
  create      Create a model from a Modelfile
  show        Show information for a model
  run         Run a model
  pull        Pull a model from a registry
  push        Push a model to a registry
  list        List models
  ps          List running models
  cp          Copy a model
  rm          Remove a model
  help        Help about any command

Flags:
  -h, --help      help for ollama
  -v, --version   Show version information

Use "ollama [command] --help" for more information about a command.
```

Some Examples
```sh
ollama serve                                       # Starts the Ollama server

ollama create -f Modelfile.yaml                    # Creates a model from a Modelfile

ollama show model_name                             # Shows information for a specific model

ollama run model_name                              # Runs a model
ollama run gemma:2b
ollama run llama3

ollama pull registry/model_name:tag                # Pulls a model from a registry
ollama pull gemma:2b

ollama push model_name registry/model_name:tag     # Pushes a model to a registry

ollama list                                        # Lists all models available

ollama ps                                          # Lists all running models

ollama cp source_model_name destination_model_name # Copies a model

ollama rm model_name                               # Removes a model
```

## Running in the Terminal
Once you start a model in the terminal you can start chatting with it. The model will respond to your messages. Most models have additional commands that can be used to interact with them. You can type /? to see a list of available commands.

```sh
ollama run llama3
>>> /?
Available Commands:
  /set            Set session variables
  /show           Show model information
  /load <model>   Load a session or model
  /save <model>   Save your current session
  /clear          Clear session context
  /bye            Exit
  /?, /help       Help for a command
  /? shortcuts    Help for keyboard shortcuts

Use """ to begin a multi-line message.

>>>
Use Ctrl + d or /bye to exit.
>>>
```

## Models
On the website you can browse the available models in the [Ollama Models Library](https://ollama.com/library).

- mixtral:latest - 8*7B - 26 GB
- llama3:latest - 8B - 4.7 GB
- mistral:latest - 7B - 4.1 GB
- llama2:latest - 7B - 3.8 GB
- phi3:latest - 3.8B - 2.4 GB

## Modelfiles
A model file is the blueprint to create and share models with Ollama. It contains all the information needed to run a model, including the model name, description, and the Docker image to use. You can create a Modelfile from scratch or use an existing one as a template.
The modelfiles allows to customize a model to a specific purpose, similar to GPT's.

Many modelfiles can be found on the [openwebui website](https://openwebui.com/)

## Interface API
The Ollama API is a RESTful API that allows you to interact with Ollama programmatically. You can use the API to create, run, and manage models, as well as to view results and logs. The API is designed to be easy to use and well-documented, making it simple to integrate Ollama into your existing workflows. The API can be accessed through the URL: [http://localhost:11434](http://localhost:11434)

There are different endpoints available:
- http://localhost:11434/api/generate
- http://localhost:11434/api/chat


Simple example how to use them with `curl`:
```sh
curl http://localhost:11434/api/generate -d '{
  "model": "mistral",
  "prompt":"Why is the sky blue?"
}'

curl -X POST http://localhost:11434/api/generate -d '{
  "model": "llama2",
  "prompt": "Why is the sky blue?"
}'

curl http://localhost:11434/api/chat -d '{
  "model": "mistral",
  "messages": [
    { "role": "user", "content": "why is the sky blue?" }
  ]
}'
```

!!! info
    The difference between `generate` and `chat` is that `generate` only generates a single response, while `chat` can generate multiple responses in a conversation. The `chat` has a `messages` array that can be used to simulate a conversation.