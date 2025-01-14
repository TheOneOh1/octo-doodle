# Octo-doodle
- This project demonstrates a simple DevOps CI/CD pipeline using GitHub Actions to automatically deploy a static HTML web page using Docker and Nginx.
- The pipeline builds a Docker image, checks for any running containers, stops them if they exist, performs code analysis with SonarQube, and deploys a new container with the updated changes. Additionally, the final container image is saved as an artifact.


### Technologies Used
  1. GitHub
  2. GitHub Actions
  3. Docker
  4. SonarQube (optional)


### Project Structure

| **File**                 | **Purpose**                                                           |
| ------------------------ | --------------------------------------------------------------------- |
| index.html               | The main static HTML file                                             |
| Images                   | A directory containing images used in the website.                    |
| Dockerfile               | Defines how to build a Docker image using Nginx as the base.          |
| kill_container.sh        | A script to stop any previously running container to avoid conflicts. |
| sonar-project.properties | Configuration file for SonarQube code analysis.                       |
| .github/workflows/ci.yml | The YAML file defining the GitHub Actions workflow.                   |

_______________

Pallavi branch created
