# Open Telemetry 

OpenTelemetry는 telemetry(trace, metric and logs) 데이터를 만들고 관리하는 API, SDK, 도구 통합 세트입니다.  

- 오픈 텔레메트리 ( OpenTelemetry ) = 오픈 트레이싱(Open Tracing) + 오픈 컨센서스 (Open Concensus)

## 옵저버빌리티의 핵심 컴포넌트 

- 메트릭 ( Metrics )
- 로그 ( Logs )
- 트레이싱 ( Traces )

```go
package main

import (
	"context"
	"fmt"
	"time"

	"github.com/gin-gonic/gin"
	"go.opentelemetry.io/otel"
	"go.opentelemetry.io/otel/attribute"
)

func main() {
	ctx := context.Background()
	external.InitTracer(ctx)

	sqlClient := external.NewDatabase()
	coreDB := sqlClient.MysqlCoreForContent()

	sampleService := service.NewSampleService(repository.NewSampleRepository(coreDB))
	r := gin.Default()

	// Middleware
	r.Use(RequestProcessingTimeLogger(), OpenTelemetryMiddleware())

	r.GET("/ping", func(c *gin.Context) {
		spanCtx, span := external.GetProvider().Tracer("sampleService").Start(c.Request.Context(), "GrpcSelectSample")
		defer span.End()

		selectSample, err := sampleService.SelectSample(spanCtx, sample.SampleRequest{CmpId: "test_sample_cmp_id"})

		if err != nil {
			span.RecordError(err)
			span.SetAttributes(attribute.String("sample_id1", "asdfsafdsadfasfd"))
			span.SetAttributes(attribute.String("sample_id2", "sadfsafdsafdasdf"))

			c.JSON(500, gin.H{
				"error": err.Error(),
			})
			return
		}

		c.JSON(200, gin.H{
			"message": selectSample,
		})
	})

	r.Run()
}

// RequestProcessingTimeLogger is a middleware function that logs the time taken to process a request.
func RequestProcessingTimeLogger() gin.HandlerFunc {
	return func(c *gin.Context) {
		// Before request
		startTime := time.Now()

		// Process request
		c.Next()

		// After request
		endTime := time.Now()
		processingTime := endTime.Sub(startTime)

		// Log the time taken to process the request
		fmt.Printf("Processing time: %v\n", processingTime)
	}
}

// OpenTelemetryMiddleware is a middleware function that creates a new trace for each incoming HTTP request.
func OpenTelemetryMiddleware() gin.HandlerFunc {
	return func(c *gin.Context) {
		tracer := otel.Tracer("")
		ctx, span := tracer.Start(c.Request.Context(), c.FullPath())
		defer span.End()

		// Store the span context in the gin.Context
		c.Request = c.Request.WithContext(ctx)

		// Process request
		c.Next()
	}
}

```

## Refrences 

> [https://opentelemetry.io/docs/instrumentation/go/getting-started/](https://opentelemetry.io/docs/instrumentation/go/getting-started/)  
> [Manual Setting](https://opentelemetry.io/docs/instrumentation/go/manual/)     
> [Manual Real Sample](https://github.com/open-telemetry/opentelemetry-go/tree/main/example)   
> [Open Telemetry](https://haandol.github.io/2021/12/13/demystifying-observability-and-opentelemetry-2.html#fn:2)   
> [Open Telemetry - Sample Settings](https://uptrace.dev/opentelemetry/go-tracing.html#adding-span-events)    
> [Uptrace](https://uptrace.dev/get/opentelemetry-apm.html).    
> [Trace Test](https://github.com/open-telemetry/opentelemetry-go/blob/main/sdk/trace/trace_test.go).   