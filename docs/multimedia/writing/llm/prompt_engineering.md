---
tags:
- multimedia
- writing
- llm
- chatgpt
- prompt engineering
---

![](img/logo.svg){.center width="20%"}

# Prompt Engineering Frameworks

- [RTF](./prompt_engineering.md#rtf) - Role, Task, Format
- [RISEN](./prompt_engineering.md#risen) - Role, Instructions, Steps, End goal, Narrowing (Constraints)
- [RODES](./prompt_engineering.md#rodes) - Role, Objective, Details, Examples, Sense Check

## RTF
Role, Task, Format
```md
Act like a [insert role]. Give me a [insert task] in [insert format] format.
```

### Example
```md
Act like a Software Developer. Give me a Code Review Summary in Markdown format.
```

## RISEN
Role, Instructions, Steps, End goal, Narrowing
```md
Role: [insert role]
Main Task: [Insert task.]
Steps to complete task: [Insert numbered list of steps to follow.]
Goal: [Insert goal of the output]
Constraints: [Enter constraints].
```

### Example
```md
Act as a Project Manager of a Innovation Interdisciplinary Team.

Develop a Project Plan for the upcoming product launch.

Steps to Complete Task:
- Conduct a kickoff meeting with the project team to outline goals and expectations.
- Break down the project into key phases and deliverables.
- Define roles and responsibilities for each team member.
- Estimate the duration and effort required for each task.
- Identify dependencies between tasks and create a timeline.
- Allocate resources and budget for the project.
- Establish a risk management plan to mitigate potential issues.
- Schedule regular progress meetings and checkpoints.
- Develop a communication plan to keep stakeholders informed.
- Finalize the project plan and obtain approval from key stakeholders.

Goal: Create a comprehensive Project Plan that ensures a successful and timely product launch, meeting quality standards and stakeholder expectations.

Constraints: Limited budget for unforeseen expenses, tight timeline due to market demands, and the need to coordinate with multiple departments within the organization.
```

## RODES
Role, Objective, Details, Examples, Sense Check
```md
Role: [Insert role]
Objective: [Insert objective]
Details: [Insert context or constraints]
Examples: Here are good examples you can use to model your answer.
[Insert examples]
Sense Check: Do you understand the objective and the specific guidelines for this task?
```


### Example
```md
Role:
You are a seasoned project manager leading a cross-functional team within a technology company. Your role is to spearhead the development and implementation of a new customer relationship management (CRM) system to enhance organizational efficiency and improve customer experience.

Objective:
Your primary objective is to successfully deliver a state-of-the-art CRM system that meets the company's unique needs. The project should streamline internal processes, optimize data management, and provide a user-friendly interface for both employees and customers. Timely delivery within the established budget and scope is crucial for project success.

Details:
Initiate the project by conducting a thorough needs analysis with key stakeholders from various departments. Collaborate with the IT team, user experience designers, and customer support to gather requirements. Develop a detailed project plan, outlining phases, milestones, and resource allocation. Clearly define roles and responsibilities within the project team and establish effective communication channels.

Examples:
Provide examples of innovative features that could be incorporated into the new CRM system, such as AI-driven analytics for customer behavior prediction, seamless integration with other enterprise systems, and personalized customer communication modules. Reference successful CRM implementations in other industries to inspire confidence in the proposed innovations.

Sense Check:
Evaluate the project's feasibility by considering potential challenges, resource constraints, and technological dependencies. Conduct regular sense checks with stakeholders to ensure alignment with organizational goals and to address any emerging issues promptly. Prioritize transparency and effective communication to maintain stakeholder confidence throughout the project lifecycle.
```