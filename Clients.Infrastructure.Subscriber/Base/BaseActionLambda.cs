using JetBrains.Annotations;

namespace Clients.Infrastructure.Subscriber.Base;

public abstract class BaseActionLambda<TRequest>
{
    [PublicAPI]
    public async Task Run(TRequest request)
    {
        await HandleAsync(request);
    }

    protected abstract Task HandleAsync(TRequest request);
}
