# Ray Summit2024 (rs24)

A python venv for exploring AnyScale ray example templates.
Personal thoughts and notes on attendance the 2024 ray summit are also included.

## Project Organization

```
.
| .gitattributes         <- be check-in friendly to both Windows and Linux
| .gitignore             <- don't check this stuff in
| activate               <- activate `venv` with `source activate`
| Makefile               <- make venv / build /publish package
| README.md              <- this readme
| requirements-torch.txt <- pytorch requirements
| requirements.txt       <- venv requirements
| test_environment.py    <- verify venv works, run `source activate` first
| requirements.txt       <- The requirements file for reproducing the python venv.
| requirements_torch.txt <- Pytorch requirements for the venv. 
├── notes                <- Personal notes from the 2024 Ray Summit.
└── src                  <- Source cloned from https://github.com/anyscale/templates.git
```

## Getting started

1. Make the venv, activate it, and set it up for use in your debugger as described below.
2. Start with exploring [templates/templates/ray-summit-core-masterclass/Ray_Core_1_Remote_Functions.ipynb](./templates/templates/ray-summit-core-masterclass/Ray_Core_1_Remote_Functions.ipynb).  Configure the jupyter notebook to used the venv as its kernel.  Most ot the ray core examples in this folder should work except fo rhe ADAG example which requires and environment with multiple GPUs. This notebook is also worth exploring [.templates/templates/ray-summit-core-masterclass/bonus/1_core_examples.ipynb](.templates/templates/ray-summit-core-masterclass/bonus/1_core_examples.ipynb).
3. An example of hyper-parameter search with training with pytorch can be found here: [.templates/templates/intro-tune/README.md]/(.templates/templates/intro-tune/README.md).  This is a modification of this example: [docs.ray.io/en/latest/tune/examples/tune-pytorch-cifar.html](https://docs.ray.io/en/latest/tune/examples/tune-pytorch-cifar.html).
3. Bonus: check out [templates/templates/ray-summit-end-to-end-llms/01_Finetuning_LLMs.ipynb](./templates/templates/ray-summit-end-to-end-llms/01_Finetuning_LLMs.ipynb).

## Python virtual environment (venv) commands

Create the venv

    make venv

to activate the venv:

    source activate

to deactivate the venv:

    deactivate

to clean the venv:

    make clean-all

## Make commands

```{bash}
make help

help      This help
clean     Removes build artifacts
clean-all Remove the virtual environment and build artifacts
venv      Create/update project's virtual environment. To activate, run: source activate.sh
```

## Debugging

Debuging requires using the python virtual environment (venv) for the project.  The venv must first be created and activated.
