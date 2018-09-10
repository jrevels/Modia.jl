

#using Modia
using Test

@testset "RunExamples" begin

Modia.ModiaLogging.resetTestStatus()

global figure = 1
include("CurrentController.jl")
include("Rectifier.jl")
include("CauerLowPassFilter.jl")

include("LinearSystems.jl")
include("SynchronousExamples.jl")
include("ElectricalVehicleAndCharger.jl")
include("CollidingBalls.jl")
include("HeatTransfer2D.jl")

Modia.ModiaLogging.printTestStatus()

end # testset
nothing
