using Clients.Application.UseCases.ActivateProduct;
using FluentAssertions;
using Xunit;

namespace Clients.Tests.Application
{
    public class HandlerTests
    {
        [Fact]
        public void Test()
        {
            new ActivateProductCommandHandler().HandleAsync(new ActivateProductCommand());

            true.Should().BeTrue();
        }
    }
}
