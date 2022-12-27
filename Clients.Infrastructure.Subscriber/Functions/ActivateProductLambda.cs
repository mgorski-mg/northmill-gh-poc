using Clients.Application.UseCases.ActivateProduct;
using Clients.Infrastructure.Subscriber.Base;
using JetBrains.Annotations;

namespace Clients.Infrastructure.Subscriber.Functions;

public record ActivateProductRequest;

[PublicAPI]
public class ActivateProductLambda : BaseActionLambda<ActivateProductRequest>
{
    private readonly ActivateProductCommandHandler _handler;

    public ActivateProductLambda()
    {
        _handler = CreateHandler();
    }

    protected override async Task HandleAsync(ActivateProductRequest request)
    {
        var command = new ActivateProductCommand();

        await _handler.HandleAsync(command);
    }

    private ActivateProductCommandHandler CreateHandler() => new();
}
