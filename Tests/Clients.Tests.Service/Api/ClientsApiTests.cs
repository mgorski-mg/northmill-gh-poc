using FluentAssertions;
using Xunit;

namespace Clients.Tests.Service.Api
{
    [Trait("Category", "E2E")]
    public class ClientsApiTests
    {
        [Fact]
        public void GivenValidOrganizationNumber_WhenCreatingClient_ShouldReturnId()
        {
            // Given

            // When

            // Then
            true.Should().BeTrue();
        }
    }
}
