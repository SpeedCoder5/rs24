# Ray Summit2024 (rs24)

Personal thoughts and notes on attendance the 2024 ray summit are also included.

## Ray Summit

- Anyscale console: https://console.anyscale.com/

## Ray Core Masterclass

- use jupyter lab instead of vscode
bonus/1_core_examples.ipynb
- Focused on creating reinforcement learning environment
- wanted to be able to have heterogeneous
  - i/o storage
  - compute gpu
  - compute cpu
- better than hadoop with a graph of dependency of operations
- need a way to know what is what
- can scale to many millions of tasks
- square.remote(3) returns futures or promise handel
- ray.get() waits and blocks to get result <- only do this when you need to so
- task graphs
- pass remote promise refs to other ray functions to build dependencies
- philosophy: explicit is better than implicit
  - be explicit about what is done remote, what is remote io
- ray actors: batch transformation, and services
  - i.e. load a model, handle a request, give a response, tear down
  - an actor i s a distributed class instance
- docs.ray.io -> actors -> async i/o, concurrency for actors
- actors can launch tasks
- be careful using get, because it can block (await too)
  - focus on forwarding eventual result handles instead
- you can define tasks inside an actor
- ray uses heuristic to do compute closest to where data is (unless that node is overloaded) data locality vs locus of compute
- every worker has a raylib, which is where the scheduling is fully distributed
- raylet sound like kubelet, can you run tasks on specific containers, i.e. different actors have different dependencies
- ray has nodes, worker processes, 
- ray.init is global (can spec environment here?)
  - better to tell ray what resources are ahead of time
  - let ray choose where it runs
    - i.e. a container with an out of date python w/ libs, i.e. specifying an "environment"
  - data must be compatible between environments
- ray.put (take an object an put it in ray's distributed object store (was called plasma object store)
  - store results of computations
  - ray will put stuff in to the store automatically
  - objects are cleaned up by reference counting
  - should your data for training go in object store?
- raylet, like kubelet?
- numpy or pyarrow format (workers can access data without creating a local copy)
  - torch tensors (do create local), but can use tensor.numpy or numpy as tensor

## Ray Share - marketing spotlight

- Sam, keynote - TPM@anyscal ray slack
- **RayCompiledGrahs**
- raycore: data, training, inference, but performancce at millscond scale is a problem
- ray compiled graphs raycoapi but moch lower gpu-gpu communication
- microsbenchmarks (ms - micros seconts)
- aDAG - allocate once
- example Ray_core_6_adag 

## checking state of tasks, 1_coe_examples.pynb

- use "python futures api"
- concurrent futures
- What about **ray data**?
- there is also ray.wait()
- be as general as ou can when defining resources, let ray figure out how to use what when

## Ray_core_5_bestPractices

- ray.remote num-returns - can be 3 or a iterator (for LLM tokens)
- can chunk batches
- KeyError can occur if 0 head CPU (not worker)
- look at docs.ray.io for best practices (design patterns and anti-patterns)
- ray.wait() - in general ray.wait all the way to the beginning
- ray data vs. object store
  - object store - things you are manipulating across time
  - ray data - data processing at larger scale (i.e. TB data) - define chunks
    - point at source, i.e. like torch DataLoader, batching, etc. 
    - ray schedules and optimizing objects
  - use raydata when you can

Lo

## bonus/2_task_lifecycle

- don't understand why pictures are not drawing (maybe fireffox?)
- by default ray ises cloudpickle which uses python scoping by default

## Templates on github

https://github.com/anyscale/templates

- Cloned and downloaded to templates/templates/ray-summit-core-masterclass

## Ray Fundamentals Certifications

## Try anyscale

## Train at scale

- DDP - Distributed Data Parallelization
- v

# End to End LLM Workflows

- anyscale platform

# Training large models at scale

Met Matthew Deng @ Anyscale - way to train large models at scale

- use https://pytorch.org/tutorials/intermediate/FSDP_adavnced_tutorial.html with Ray Train

Met Matt Conner

- Matt will set me up with a sales person from anyscale
https://pytorch.org/tutorials/intermediate/FSDP_adavnced_tutorial.html

## Ray Compnent Summary

| Component    | Description                                            | Key Features                                      |
|--------------|--------------------------------------------------------|---------------------------------------------------|
| **Ray Core** | Foundational library for distributed computing.        | - Parallel task execution<br>- Remote function execution<br>- Object storage for data sharing  |
| **Ray Tune** | Hyperparameter tuning and optimization library.       | - Various search algorithms<br>- Integrates with ML frameworks<br>- Manages trials and checkpoints   |
| **Ray Data** | Scalable data processing and manipulation library.     | - Distributed data loading and transformation<br>- Supports popular data formats<br>- Lazy evaluation for optimization |
| **Ray Train**| Library for distributed training of ML models.        | - Scalability across nodes and GPUs<br>- Supports data/model parallelism<br>- Integrates with ML frameworks |
| **Ray Serve**| API for serving ML models for inference.               | - Deploys models at scale<br>- Supports A/B testing<br>- Autoscaling based on traffic   |
| **Ray RLlib**| Library for reinforcement learning.                     | - Variety of algorithms<br>- Scalable training<br>- Integration with environments like OpenAI Gym |

## Day 3 

### Keynote

- Samsara - John Bicket - Transforming the World of Physical Operations with Ray
- Physical services (~ 40% gdp)
  - transportation
  - logistics
  - waste management
  - chemical transport
  - construction
- keep equipment online
- loop: action > data > insignts > repeat
- platform
  - safety, video
  - telematics
  - workforce apps
  - connected equipment
  - site visibility
- ai insignts
- operations data
- safety
  - monitor and grade drivers safety
  - USIC - underground - "call before you dig"
  - safety culture is important
  - seatbelt image detection
  - drowsiness detection - video

### Recursion

Stephen mackinnon VP appplied ML - recursion Pharmaceuticals

- massive, unstructured, multi-modal data
- drug discovery
  - everything is a model: molecules, dna, cells, organic compounds, animals
  - models for each thing get to use years of previous scientific data
- how to predict new things?
- youtube.com/@recursionpharma
- LLM
- looking at millions of cells from microscops
- use "mass autoencoder"
  - used to detect similarity of images
  - input > mask > train transformer encoder > decoder > reconstruction
                                - mae embedding
  - 25.7% increase in expressed gene knock-outs with our new model
- plot embeddings
  - project with new compounds
- embedding modesl of biological things
- ai better than humans allows for bright field imaging instead of staining (allows time to be added to models)
- transcriptomics: multi-modal data scalees
  - heat map like representation of different layers
- detect and monitor mice
  - changes in eating / sleeping / drowsiness
- also using llmls
- live 3d plots of things

## Brandon Leonardo from Instacart

- What's for dinner
- budget, sickness, eat healthier
- generative AI
- healthy meal, customer support chat
- action graph carebot
  - i.e. when do you want your order
  - customers want agents to be able to do things for them
- i.e. "Soccer snacks fro 20 kids?"
- meet the customer where they are
- catalog all the items, buy 1 of everything
  - extract llm (wine pairing, is product organic, etc) - using batch VLLM
- boost internal productivity
- cultural shift toward AI adoption - everyone needs to figure out how to use AI
- Ava internal tool to democrotize ai
- AI empowered stories
- Make it easy for people to do the right thing
- AI gateway
  - other people besides ML engineers started building models (i.e. accountants)
- personalized planogram (grocery store map)
  - i.e. look a labels ahead of time
- instacart personalized to each person
- solve the core propblem for your customers
- invest in AI usage across your coming
- make ai tooling avialable for whole team 

## Kevin Weil - CPO OpenAI

- product management at open AI
- culture of consensus can drive speed or not of adaptation
- no common floor
  - models always getting better at things at different rates
- mew stuff coming out so fast
  - philosophy: more ai is better for the world
  - reltime voice api
  - used advanced voice mode to translate voice to other people (english / korean)
  - distillation - smaller specific models from foundation models
  - more intellignce, faster, better, safer
- gpt4-o1 - reasoning model
  - really good a science, math, pure reasoning
  - gives summary of how it is thinking
  - 90% better than all grad students
- science to summary task
- probable summary tasks will lead to reasoning task 
- will be able to ask AI to do things for your in the future (besides just answer questions now
- try to find the edge of what the product quite can't do
  - build a product to that
  - can't wait for next big model launch (will be able to do it in a few months)
- trend toward additional inference for thinking
- how to montize consumer facing AI?
- behavior and personality of model is a product in itself
- written and spoken english are different languages (styles)
- chat UX, voice prompt
  - openai wants models to interact
  - sora video on the fly
  - wonder how long chat inferface will hold, may still hold
- politically correct left leaning vs right
- what about "values"
  - open ai has publish a "spec" - out for comment
  - is model not following the spec
  - or spec is not what it should be
- safety
  - both wrapping app and model
  - defense a depth
- adoption - push more and more makes the model safe
- thinks future will be "Fun"
- every kid with a personalized tutor
- less intelligence limited vs. eval limited
- make model available on specific knowledge that openai does not have access to data

## Waymo for first time - self driving car
