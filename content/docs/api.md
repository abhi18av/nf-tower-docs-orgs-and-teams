---
title: Application programming interface
aliases:
- "/docs/api"
weight: 1
layout: single
publishdate: 2020-10-20 04:00:00 +0000
authors:
  - "Evan Floden"
  - "Alain Coletta"
  - "Seqera Labs"
headline: "Tower API"
description: 'Using the Nextflow Tower API.'
menu:
  docs:
    parent: API
    weight: 1


---

Tower is API centric, it exposes a public API with all necessary calls to manage and monitor Nextflow workflows programmatically. This allows organizations to extend their existing solutions by leveraging the Tower API.

## Authorization token

Authorization tokens can be found on your settings on the top right of the page. Select `Your tokens` and click on the `Show HTTP token` button.

{{% pretty_screenshot img="/uploads/2020/10/api_tokens.png" %}}

<br>

## Example call using the cURL command


{{< highlight bash >}}
curl -H "Authorization: Basic QH..E5M=" https://tower.nf/api/workflow
{{< /highlight >}}

where `QH..E5M=` is the authorization token shown in the screenshot above.  

{{% pretty_screenshot img="/uploads/2020/10/api_example_call.png" %}}

<br>

## API docs

Detailed API documentation can be found in the [API page](https://tower.nf/openapi/index.html).
