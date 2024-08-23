---
tags:
  - multimedia
  - writing
  - llm
  - chatgpt
  - prompt engineering
---

![](img/logo.svg){.center width="20%"}

## Contents

{nav}

## LLM Prompt Engineering

- **Avoid loaded language**: LLM's works best with objective facts, figures, and plain inputs, so try to be neutral and avoid subjective framing.
- **Be specific**: Ensuring you specify a response word count, a desired tone of voice, and other specifics will decrease the likelihood you’ll have to request another answer.
- **Specify what you don’t want**: It can sometimes help to tell LLM's to produce an amenable answer if you also specify what you don’t want it to do.
- **Provide examples**: Much like a human, LLM's often understands best when you provide an example for it to work with, especially if you want it to produce something that closely resembles something you’ve seen.
- Ask to **“act like”** someone: Sometimes, it can help to start your prompt by askin to “act like” a certain type of person that would be particularly well-placed to respond to the query you're posing.

These are some prompts which resulted in good answers from the most common LLM's.

## Context collection

```
Take the next inputs as context. Do not respond until I use the keyword "asdf"
```

## Learning

```
I want to learn about <topic> find and share the most important 20% of learnings on this topic so that I can understand 80% of it.
```

```
I would like to learn about <topic>. Please provide me with a brief summary that could be understood by a 10-year-old.
```

## Writing

```
I want you to proof read my writing, fix any spelling and grammar mistakes, and make suggestions to improve the quality and clarity of my writing
```

## Summarize

```
I want you to summarise the text and give me a bullet point breakdown of the key points and facts
```

## Output definition

```
Write your answer in form of ASCII-ART
```

```
Write your answer in form of a Mermaid Diagram
```

```
Write your answer in form of a copyable Markdown Text
```

```
Write your answer in form of a Table
```

## Change tone

```
Adopt a formal tone in your responses.
```

```
Adopt an informal tone in your responses.
```

## Act as <>

```
Act as a Professor in of a University in the Domain Real-Time Programming, Digital Design, Industry 4.0, Systems Engineering
```
