using System.Threading.Tasks;

namespace Clients.Application.UseCases.ActivateProduct;

public record ActivateProductCommand;

public class ActivateProductCommandHandler
{
    public Task HandleAsync(ActivateProductCommand command) => Task.CompletedTask;
}
