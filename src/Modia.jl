#=
Modia main module.

* Developers: Hilding Elmqvist, Mogram AB, Toivo Henningsson, Lund and Martin Otter, DLR
* Copyright (c) 2016-2018: Hilding Elmqvist, Toivo Henningsson, Martin Otter
* License: MIT (expat)
=#


#import ModiaMath

"""
Modia - Dynamic Modeling and Simulation in Julia

To define a model:

```julia
  @model FirstOrder begin
     x = Variable(start=1)   # start means x(0)
     T = Parameter(0.5)      # Time constant
     u = 2.0                 # Same as Parameter(2.0)
  @equations begin
     T*der(x) + x = u        # der() means time derivative
     end
  end;
```

To simulate a model:
```julia
  result = simulate(FirstOrder, 2);
  @show result["x"][end];
  ModiaMath.plot(result, "x")
```

To run examples:
```julia
  include("$(Modia.ModiaDir)/examples/runexamples.jl")
```

To run tests:
```julia
  include("$(Modia.ModiaDir)/test/runtests.jl")
```
For more information, see (https://github.com/ModiaSim/Modia.jl/blob/master/README.md)
"""
module Modia

const Version = "0.2.0-beta.11"
const Date = "2018-09-08"

#println(" \n\nWelcome to Modia - Dynamic MODeling and Simulation in julIA")
print(" \n\nWelcome to ")
print("Mod")

printstyled("ia", bold=true, color=:red)
print(" - ")
printstyled("Dynamic ", color=:light_black)
print("Mod")
printstyled("eling and Simulation with Jul", color=:light_black)
printstyled("ia", bold=true, color=:red)

println()
println("Version $Version ($Date)")
println("Type \"?Modia\" for help.\n\n")

const ModiaDir = dirname(Base.@__DIR__)

export ModiaDir

export @model, simulateModel, simulate, checkSimulation, simulateMultiModeModel
export Variable, Float, Boolean, Integ, Str, Parameter, Var, Par, undefined
export Variability, constant, parameter, discrete, continuous
export Property, general, symmetric, orthogonal, rotationGroup3D
export skew, skewCoords
export allInstances
export @component, addComponent!

include("language/ModiaLogging.jl")
include("language/Instantiation.jl")
include("language/Execution.jl")

include("symbolic/DAEquations/Synchronous.jl") # Before models/Electric, etc
include("symbolic/symbolic.jl")

using .Instantiation

include("models/ModiaBase.jl")
include("models/models.jl")  # Before symbolic because MultiBody is used in BasicStructuralTransform


end
