public class WeatherForecastTests
{
    [Fact]
    public void WeatherForecast_Summary_ShouldNotBeEmpty()
    {
        var forecast = new WeatherForecast(DateOnly.FromDateTime(DateTime.Now), 20, "Sunny");
        Assert.False(string.IsNullOrEmpty(forecast.Summary));
    }

    [Theory]
    [InlineData(-50)]
    [InlineData(60)]
    public void WeatherForecast_TemperatureF_CalculatesCorrectly(int tempC)
    {
        var forecast = new WeatherForecast(DateOnly.FromDateTime(DateTime.Now), tempC, "Test");
        Assert.Equal(32 + (int)(tempC / 0.5556), forecast.TemperatureF);
    }
}