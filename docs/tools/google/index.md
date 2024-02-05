---
tags:
- tools
- google
---
# Google

![](img/logo.svg){.center width="30%"}

## Advanced Search

| Title                | Searchcommand                | Description                       |
|----------------------|------------------------------|-----------------------------------|
| AND                  | `term1 AND term2`            | Both terms need to be present     |
| OR                   | `term1 OR term2`             | One of terms need to be present   |
| Exlude               | `term1 -term2`               | term1 but not term2 need to be present |
| Wildcard             | `term1 * term2`              | `*` will act as a wildcard and match any word or phrase |
| Grouping             | `(term1 OR term2) AND term3` | create search term hierarchies    |
| Cache                | `cache:google.com`           | returns the most recent version of the webpage |
| filetype             | `searchterm filetype:svg     | filetype:pdf` | Searched for files with a given type  |
| Site specific search | `site:apple.com`             | Searches only on a give n website |
| Dictionary           | `define:term`                | Returns meaning of the word       |

## Gmail
### Attachements

```
size:5mb has:attachment
```

```
size:10mb has:attachment filename:pdf
```

### Sizes

```
larger_than:5m smaller_than:8M
```

### Not labeled

Reliable

```
-has:userlabels -in:sent -in:chat -in:draft -in:inbox
```

Less reliable

```
has:nouserlabels -in:sent -in:chat -in:draft -in:inbox
```

Impractical

```
-label:{label1 label2} -label:label-three -label:label-four -in:sent -in:chat -in:inbox
```
