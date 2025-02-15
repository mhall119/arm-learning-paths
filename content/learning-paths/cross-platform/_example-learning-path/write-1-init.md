---
# User change
title: "Write: Initialize a directory"

weight: 4 # 1 is first, 2 is second, etc.

# Do not modify these elements
layout: "learningpathall"
---

## Add a new Learning Path

To add a new Learning Path, first decide the appropriate category. There are 5 categories into which you can contribute content:
* server-and-cloud
* desktop-and-laptop
* embedded
* microcontroller
* mobile

{{% notice Note%}}
Place your Learning Path in the category closest to the environment where the software runs. The tags on the [front page of the website](/) help explain the categories. Feel free to ask on GitHub if you are unsure which category best matches your Learning Path. 
{{% /notice %}}

### Create a new Learning Path

You should start building your Learning Path from the provided template using a straightforward one-line command. For example, to create a new Learning Path with the directory name `my-new-learning-path` under the `microcontroller` category, run the following command (from the root directory of this project):
```bash
hugo new --kind learning-path learning-paths/microcontroller/my-new-learning-path
```
This will then add the following markdown files in the `my-new-learning-path` directory:


| Files                 | Details |
|---------------        |----------|
| _index.md             | This file contains the title, target audience, and tagging metadata for your new Learning Path. The next step of this Learning Path explains these metadata elements and how to fill them out properly. |
| how-to-1.md       | This file contains the how-to content for the Learning Path. Create multiple how-to pages to segment steps within your Learning Path. Each `how-to-N.md` file represents another distinct step in your tutorial. Name this file to reflect the content you are adding. |
| example-picture.png  | (optional) Pictures and screenshots can be included in this directory to appear in your Learning Path (images can also be referenced as web links if desired). |
| _review.md            | This file contains simple questions and answers to reinforce knowledge gained from your Learning Path.    |
| _next_steps.md        | This file contains the next recommended steps and related resources for the reader to follow on completion of this Learning Path.   |

### View the new Learning Path

You can verify you have correctly copied the template by viewing the new Learning Path. 

1. Run Hugo server locally

If Hugo is not already running start it. 

```console
hugo server
```

2. View the learning path you just created in your browser

In a browser tab, open [http://localhost:1313/learning-paths/server-and-cloud/my-new-learning-path](http://localhost:1313/learning-paths/server-and-cloud/my-new-learning-path)

3. Refer to the appendices listed below for content formatting and style guidance

You should take a few minutes to understand how to format your Learning Path and review the writing style guide to learn how to best write for the target audience. 

- [Appendix: Format content](/learning-paths/cross-platform/_example-learning-path/appendix-1-formatting/)
- [Appendix: Writing style guide](/learning-paths/cross-platform/_example-learning-path/appendix-2-writing-style/)

4. Start modifying the Learning Path

You can now start modifying the markdown files using your text editor to write content for your new learning path. 

Check the results in the browser to see how they look. 


