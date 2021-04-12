FROM squidfunk/mkdocs-material:7.1.1
    MAINTAINER Abhinav Sharma <abhi18av@outlook.com>


RUN  pip install mike mkdocs-git-revision-date-plugin mkdocs-htmlproofer-plugin

# Set working directory
WORKDIR /docs

# Expose MkDocs development server port
EXPOSE 8000

# Start development server by default
ENTRYPOINT ["mkdocs"]
CMD ["serve", "--dev-addr=0.0.0.0:8000"]
