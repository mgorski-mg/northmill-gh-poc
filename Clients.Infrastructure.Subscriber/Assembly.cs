using System.Text.Json.Serialization;
using Amazon.Lambda.Core;
using Amazon.Lambda.Serialization.SystemTextJson;
using Clients.Infrastructure.Subscriber.Functions;
using ClientsSerializationContext = Clients.Infrastructure.Subscriber.ClientsSerializationContext;

// Assembly attribute to enable the Lambda function's JSON input to be converted into a .NET class.
[assembly: LambdaSerializer(typeof(SourceGeneratorLambdaJsonSerializer<ClientsSerializationContext>))]

namespace Clients.Infrastructure.Subscriber;

[JsonSerializable(typeof(ActivateProductRequest))]
public partial class ClientsSerializationContext : JsonSerializerContext {}
