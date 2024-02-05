---
tags:
- coding
- python
- datetime
---
# Datetime

Some informations about the datetime module.

## strftime

The strftime format is the standard date formatting for UNIX. It's used in C, Ruby, and more.

### Presets

| Date                     | Result |
| ------------------------ | -------------- |
| `%Y%m%d%H%M%S`           | `20130605230521` |
| `%d/%m/%Y`               | `05/06/2013` |
| `%A, %B %e, %Y`          | `Sunday, June 5, 2013` |
| `%b %e %a`               | `Jun 5 Sun` |
| `%Y-%m-%d %H:%M:%S`      | `2019-07-03 04:43:02` |

| Time           | Result |
| -------------- | -------------- |
| `%H:%M`        | `23:05` |
| `%I:%M %p`     | `11:05 PM` |

### Time

| Time     | Result         | Description |
| -------- | -------------- | --------------------- |
| `%l`     | `1`            | Hour |
| `%H`     | `00..23`       | 24h Hour |
| `%I`     | `01..12`       | 12h Hour |
| `%M`     | `00..59`       | Minute |
| `%S`     | `00..60`       | Second |
| `%p`     | `AM`           | AM or PM |
| `%Z`     | `+08`          | Time zone |
| `%j`     | `001..366`     | Day of the year |
| `%%`     | `%`            | Literal % character |

### Date

| Date     | Result        | Description |
| -------- | ------------- | --------------- |
| `%a`     | `Sun`         | Weekday |
| `%A`     | `Sunday`      | |
| `%w`     | `0..6`        | (Sunday is 0) |
| `%y`     | `13`          | Year |
| `%Y`     | `2013`        | |
| `%b`     | `Jan`         | Month |
| `%B`     | `January`     | |
| `%m`     | `01..12`      | |
| `%d`     | `01..31`      | Day |
| `%e`     | `1..31`       | |

## Pandas
### Conversion

Convert a pandas dataframe column into the datetime format

``` python
pd.to_datetime(df['col'], format='%Y-%m-%d %H:%M:%S', utc=True)
```

### Resampling

| Alias      | Description           |
|------------|-----------------------|
| `B`        | Business day          |
| `D`        | Calendar day          |
| `W`        | Weekly                |
| `M`        | Month end             |
| `Q`        | Quarter end           |
| `A`        | Year end              |
| `BA`       | Business year end     |
| `AS`       | Year start            |
| `H`        | Hourly frequency      |
| `T, min`   | > Minutely frequency  |
| `S`        | Secondly frequency    |
| `L, ms`    | Millisecond frequency |
| `U, us`    | Microsecond frequency |
| `N, ns`    | Nanosecond frequency  |

``` python
weekly_summary.resample('W').mean()
```