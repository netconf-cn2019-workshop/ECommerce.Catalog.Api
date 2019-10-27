using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using System.Threading;
using System.Threading.Tasks;

namespace ECommerce.Catalog.Api
{
    public class CatalogService : IHostedService
    {
        private readonly ILogger<CatalogService> _logger;

        public CatalogService(ILogger<CatalogService> logger)
        {
            _logger = logger;
        }

        public Task StartAsync(CancellationToken cancellationToken)
        {
            _logger.LogInformation("商品目录 微服务已启动");
            return Task.CompletedTask;
        }

        public Task StopAsync(CancellationToken cancellationToken)
        {
            _logger.LogInformation("商品目录 微服务已停止");
            return Task.CompletedTask;
        }
    }
}
