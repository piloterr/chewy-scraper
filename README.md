<p align="center">
  <a href="https://www.piloterr.com"><img src="images/banner.png" alt="Chewy Scraper API by Piloterr – scrape Chewy data as JSON" width="100%"></a>
</p>

# Chewy Scraper API

[![Discord](https://img.shields.io/badge/Discord-Join%20the%20community-5865F2?logo=discord&logoColor=white)](https://discord.gg/CFj3ph8aHU) [![Get API key](https://img.shields.io/badge/Piloterr-Get%20a%20free%20API%20key-111827)](https://app.piloterr.com) [![API docs](https://img.shields.io/badge/Docs-OpenAPI-0EA5E9)](https://app.piloterr.com/openapi) [![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

The **Piloterr Chewy Scraper API** lets you extract public data from Chewy as **clean, structured JSON** — no proxies, headless browsers or HTML parsing to maintain. Endpoints available in production:

- **Chewy Product API** — Read one Chewy product by URL or numeric id.
- **Chewy Search API** — Search Chewy by keyword or listing URL.

Use it for price monitoring, assortment tracking, competitor analysis, product research or catalog enrichment.

| Endpoint | Path | Credits | What you get |
|---|---|---|---|
| [Chewy Product API](#chewy-product-api) | `/v2/chewy/product` | 3 | Read one Chewy product by URL or numeric id. The default mode is expert and returns the historical product cache. simple returns one snake_case product. |
| [Chewy Search API](#chewy-search-api) | `/v2/chewy/search` | 3 | Search Chewy by keyword or listing URL. The default mode is expert and returns the historical listing objects. simple returns short snake_case cards. |

## Table of contents

- [How it works](#how-it-works)
- [Chewy Product API](#chewy-product-api)
- [Chewy Search API](#chewy-search-api)
- [Code examples in other languages](#code-examples-in-other-languages)
- [Practical use cases](#practical-use-cases)
- [Why Piloterr?](#why-piloterr)
- [FAQ](#faq)
- [Related scrapers](#related-scrapers)
- [Support](#support)

## How it works

1. **Create a free Piloterr account** and copy your API key from the [dashboard](https://app.piloterr.com).
2. **Send a `GET` (or `POST`) request** to `https://api.piloterr.com/v2/...` with the header `x-api-key: YOUR_API_KEY`.
3. **Receive structured JSON** — Piloterr handles rendering, proxies, retries and parsing.

```bash
export PILOTERR_API_KEY="your-api-key"
pip install requests        # Python
# TypeScript: Node.js 18+ (native fetch), run with `npx tsx file.ts`
```

> Every endpoint accepts both `GET` (query string) and `POST` (JSON body with the same fields).

## Chewy Product API

Read one Chewy product by URL or numeric id. The default mode is expert and returns the historical product cache. simple returns one snake_case product.

`GET | POST https://api.piloterr.com/v2/chewy/product` · **3 credits per request** · [Full reference](https://app.piloterr.com/openapi)

### Request parameters

| Parameter | Type | Required | Description |
|---|---|---|---|
| `query` | string | ✅ | Which product to read. A Chewy product URL such as https://www.chewy.com/purina-pro-plan-adult-sensitive-skin/dp/128666, or just the numeric id 128666. A search link, a keyword, or another website returns 400. |
| `mode` | string | — | Which JSON to return. Default expert. |
| `return_page_source` | boolean | — | Set to true to get the rendered HTML in result instead of JSON. Default false. The string false stays false and still returns JSON. |

### Python example

```python
import json
import os
import requests

response = requests.get(
    "https://api.piloterr.com/v2/chewy/product",
    headers={"x-api-key": os.environ["PILOTERR_API_KEY"]},
    params={
        "query": "https://www.chewy.com/purina-pro-plan-adult-sensitive-skin/dp/128666",
    },
    timeout=120,
)
response.raise_for_status()
data = response.json()

print(json.dumps(data, indent=2, ensure_ascii=False)[:2000])
```

### TypeScript example

```typescript
type ChewyProduct = {
  "Item:SXRlbToxMjg2NjY="?: {
    id?: string;
    gtin?: string;
    isRx?: boolean;
    name?: string;
    uses?: unknown;
    isNew?: boolean;
    images?: {
      __typename?: string;
      "url({\"autoCrop\":true,\"square\":600})"?: string;
    }[];
    videos?: {
      url?: string;
      image?: string;
      thumbnail?: string;
      __typename?: string;
    }[];
    weight?: string;
    entryID?: string;
    inStock?: boolean;
    isFresh?: boolean;
    product?: {
      slug?: string;
      __ref?: string;
      __typename?: string;
    };
    cautions?: unknown;
    isBundle?: boolean;
    isFrozen?: boolean;
    mapPrice?: string;
    fullImage?: {
      __typename?: string;
      "url({\"autoCrop\":true,\"square\":144})"?: string;
      "url({\"autoCrop\":true,\"square\":1800})"?: string;
      "url({\"autoCrop\":true,\"maxWidth\":275})"?: string;
    };
    isInStock?: boolean;
    isVetDiet?: boolean;
    onSpecial?: boolean;
    __typename?: string;
    dimensions?: unknown;
    infoGroups?: {
      name?: string;
      sections?: Record<string, unknown>[];
      __typename?: string;
    }[];
    isGiftCard?: boolean;
    [key: string]: unknown;
  };
  "Product:UHJvZHVjdDo1MjY3Ng=="?: {
    id?: string;
    mda?: {
      id?: number;
      name?: string;
      options?: Record<string, unknown>[];
      __typename?: string;
      isEnsemble?: boolean;
      manufacturerDetails?: unknown;
    }[];
    name?: string;
    slug?: string;
    rating?: number;
    entryID?: string;
    brandURL?: string;
    __typename?: string;
    isEnsemble?: boolean;
    partNumber?: string;
    breadcrumbs?: {
      id?: string;
      url?: string;
      name?: string;
      __typename?: string;
    }[];
    description?: string;
    iconography?: {
      name?: string;
      image?: string;
      __typename?: string;
    }[];
    ratingCount?: number;
    questionsCount?: number;
    manufacturerName?: string;
    ratingDistributions?: {
      rating?: number;
      __typename?: string;
      ratingCount?: number;
      ratingPercent?: number;
    }[];
    merchClassIdentifiers?: string[];
    "questions:{\"first\":4}"?: {
      edges?: Record<string, unknown>[];
      pageInfo?: Record<string, unknown>;
      __typename?: string;
      totalCount?: number;
    };
    "items({\"includeEnsemble\":true})"?: {
      __ref?: string;
    }[];
    "attributes({\"identifier\":\"PetType\"})"?: {
      values?: Record<string, unknown>[];
      __typename?: string;
    }[];
    "attributes({\"identifier\":\"DrugType\"})"?: unknown[];
    "attributes({\"identifier\":\"ProductCategory\"})"?: {
      values?: Record<string, unknown>[];
      __typename?: string;
    }[];
    "attributes({\"includeEnsemble\":true,\"usage\":[\"DEFINING\"]})"?: {
      id?: number;
      name?: string;
      values?: Record<string, unknown>[];
      __typename?: string;
    }[];
  };
};

const params = new URLSearchParams({
  "query": "https://www.chewy.com/purina-pro-plan-adult-sensitive-skin/dp/128666",
});

const response = await fetch(`https://api.piloterr.com/v2/chewy/product?${params}`, {
  headers: { "x-api-key": process.env.PILOTERR_API_KEY! },
});
if (!response.ok) throw new Error(`Piloterr error ${response.status}: ${await response.text()}`);

const data = (await response.json()) as ChewyProduct;

console.log(JSON.stringify(data, null, 2).slice(0, 2000));
```

<details>
<summary><b>POST variant</b></summary>

```http
POST https://api.piloterr.com/v2/chewy/product
x-api-key: YOUR_API_KEY
Content-Type: application/json

{"query": "https://www.chewy.com/purina-pro-plan-adult-sensitive-skin/dp/128666"}
```
</details>

### Output example

Example response from the API reference, abridged — real values depend on the page you scrape.

```json
{
  "Item:SXRlbToxMjg2NjY=": {
    "id": "SXRlbToxMjg2NjY=",
    "gtin": "038100175526",
    "isRx": false,
    "name": "Purina Pro Plan Adult Sensitive Skin & Stomach Salmon & Rice Formula Dry Dog Food, 30-lb bag",
    "uses": null,
    "isNew": false,
    "images": [
      {
        "__typename": "Image",
        "url({\"autoCrop\":true,\"square\":600})": "https://image.chewy.com/catalog/general/images/moe/0671ffce-cb9e-7b85-8000-c4f526193d1c._AC_SS600_V1_.jpg"
      },
      {
        "__typename": "Image",
        "url({\"autoCrop\":true,\"square\":600})": "https://image.chewy.com/catalog/general/images/moe/0671ffce-aa8a-7b92-8000-55ebf9862cbf._AC_SS600_V1_.jpg"
      }
    ],
    "videos": [
      {
        "url": "https://fast.wistia.com/medias/ggqjn4l7f3",
        "image": "https://embed-ssl.wistia.com/deliveries/47b887565486f8434309c72dc24488d0.jpg?image_crop_resized=528x297",
        "thumbnail": "https://fast.wistia.com/embed/medias/ggqjn4l7f3/swatch",
        "__typename": "Video"
      },
      {
        "url": "https://fast.wistia.com/medias/mznrapwfi1",
        "image": "https://embed-ssl.wistia.com/deliveries/76c99685dc5c2df732317673e82f6f9c0fb0d930.jpg?image_crop_resized=528x297",
        "thumbnail": "https://fast.wistia.com/embed/medias/mznrapwfi1/swatch",
        "__typename": "Video"
      }
    ],
    "weight": "30 pounds",
    "entryID": "128666",
    "inStock": true,
    "isFresh": false,
    "product": {
      "slug": "purina-pro-plan-adult-sensitive-skin",
      "__ref": "Product:UHJvZHVjdDo1MjY3Ng==",
      "__typename": "Product"
    },
    "cautions": null,
    "isBundle": false,
    "isFrozen": false,
    "mapPrice": "$77.48",
    "fullImage": {
      "__typename": "Image",
      "url({\"autoCrop\":true,\"square\":144})": "https://image.chewy.com/catalog/general/images/moe/0671ffce-cb9e-7b85-8000-c4f526193d1c._AC_SS144_V1_.jpg",
      "url({\"autoCrop\":true,\"square\":1800})": "https://image.chewy.com/catalog/general/images/moe/0671ffce-cb9e-7b85-8000-c4f526193d1c._AC_SS1800_V1_.jpg",
      "url({\"autoCrop\":true,\"maxWidth\":275})": "https://image.chewy.com/catalog/general/images/moe/0671ffce-cb9e-7b85-8000-c4f526193d1c._AC_SX275_V1_.jpg"
    },
    "isInStock": true,
    "isVetDiet": false,
    "onSpecial": true,
    "__typename": "Item",
    "dimensions": null,
    "infoGroups": [
      {
        "name": "Nutritional Info",
        "sections": [
          {},
          {}
        ],
        "__typename": "InfoGroup"
      },
      {
        "name": "Feeding Instructions",
        "sections": [
          {},
          {}
        ],
        "__typename": "InfoGroup"
      }
    ],
    "isGiftCard": false
  },
  "Product:UHJvZHVjdDo1MjY3Ng==": {
    "id": "UHJvZHVjdDo1MjY3Ng==",
    "mda": [
      {
        "id": 777,
        "name": "Flavor",
        "options": [
          {},
          {}
        ],
        "__typename": "MDA",
        "isEnsemble": true,
        "manufacturerDetails": null
      },
      {
        "id": 400,
        "name": "Size",
        "options": [
          {},
          {}
        ],
        "__typename": "MDA",
        "isEnsemble": false,
        "manufacturerDetails": null
      }
    ],
    "name": "Purina Pro Plan Adult Sensitive Skin & Stomach Salmon & Rice Formula Dry Dog Food",
    "slug": "purina-pro-plan-adult-sensitive-skin",
    "rating": 4.5064,
    "entryID": "52676",
    "brandURL": "https://www.chewy.com/brands/purina-pro-plan-7434",
    "__typename": "Product",
    "isEnsemble": true,
    "partNumber": "67742",
    "breadcrumbs": [
      {
        "id": "288",
        "url": "https://www.chewy.com/b/dog-288",
        "name": "Dog Supplies",
        "__typename": "Breadcrumb"
      },
      {
        "id": "332",
        "url": "https://www.chewy.com/b/food-332",
        "name": "Dog Food",
        "__typename": "Breadcrumb"
      }
    ],
    "description": "Tend to your furry friend’s skin and digestive health with Purina Pro Plan Sensitive Skin and Stomach Salmon and Rice Adult Dry Dog Food …",
    "iconography": [
      {
        "name": "Chicken-Free",
        "image": "https://image.chewy.com/catalog/cms/logos/attribute-icons/06792943-754c-776a-8000-a68f9d01b654.svg",
        "__typename": "Icon"
      },
      {
        "name": "High-Protein",
        "image": "https://image.chewy.com/catalog/cms/logos/attribute-icons/06792942-f906-7389-8000-c8ad6870776e.svg",
        "__typename": "Icon"
      }
    ],
    "ratingCount": 23686,
    "questionsCount": 151,
    "manufacturerName": "Purina Pro Plan",
    "ratingDistributions": [
      {
        "rating": 1,
        "__typename": "RatingDistribution",
        "ratingCount": 1654,
        "ratingPercent": 6.983
      },
      {
        "rating": 2,
        "__typename": "RatingDistribution",
        "ratingCount": 605,
        "ratingPercent": 2.5543
      }
    ],
    "merchClassIdentifiers": [
      "f2-science",
      "f2-science-science-food"
    ],
    "questions:{\"first\":4}": {
      "edges": [
        {},
        {}
      ],
      "pageInfo": {
        "endCursor": "YXJyYXljb25uZWN0aW9uOjM=",
        "__typename": "PageInfo",
        "hasNextPage": true,
        "startCursor": "",
        "hasPreviousPage": false
      },
      "__typename": "QuestionConnection",
      "totalCount": 151
    },
    "items({\"includeEnsemble\":true})": [
      {
        "__ref": "Item:SXRlbToxMjk4MDk="
      },
      {
        "__ref": "Item:SXRlbToxMjk4MTE="
      }
    ],
    "attributes({\"identifier\":\"PetType\"})": [
      {
        "values": [
          {}
        ],
        "__typename": "Attribute"
      }
    ],
    "attributes({\"identifier\":\"DrugType\"})": [],
    "attributes({\"identifier\":\"ProductCategory\"})": [
      {
        "values": [
          {}
        ],
        "__typename": "Attribute"
      }
    ],
    "attributes({\"includeEnsemble\":true,\"usage\":[\"DEFINING\"]})": [
      {
        "id": 777,
        "name": "Flavor",
        "values": [
          {}
        ],
        "__typename": "Attribute"
      },
      {
        "id": 400,
        "name": "Size",
        "values": [
          {},
          {}
        ],
        "__typename": "Attribute"
      }
    ]
  }
}
```

### Response fields

| Field | Type | Description |
|---|---|---|
| `Item:SXRlbToxMjg2NjY=` | object |  |
| `Item:SXRlbToxMjg2NjY=.id` | string |  |
| `Item:SXRlbToxMjg2NjY=.gtin` | string |  |
| `Item:SXRlbToxMjg2NjY=.isRx` | boolean |  |
| `Item:SXRlbToxMjg2NjY=.name` | string |  |
| `Item:SXRlbToxMjg2NjY=.uses` | object |  |
| `Item:SXRlbToxMjg2NjY=.isNew` | boolean |  |
| `Item:SXRlbToxMjg2NjY=.images[]` | object[] |  |
| `Item:SXRlbToxMjg2NjY=.videos[]` | object[] |  |
| `Item:SXRlbToxMjg2NjY=.weight` | string |  |
| `Item:SXRlbToxMjg2NjY=.entryID` | string |  |
| `Item:SXRlbToxMjg2NjY=.inStock` | boolean |  |
| `Item:SXRlbToxMjg2NjY=.isFresh` | boolean |  |
| `Item:SXRlbToxMjg2NjY=.product` | object |  |
| `Item:SXRlbToxMjg2NjY=.cautions` | object |  |
| `Item:SXRlbToxMjg2NjY=.isBundle` | boolean |  |
| `Item:SXRlbToxMjg2NjY=.isFrozen` | boolean |  |
| `Item:SXRlbToxMjg2NjY=.mapPrice` | string |  |
| `Item:SXRlbToxMjg2NjY=.fullImage` | object |  |
| `Item:SXRlbToxMjg2NjY=.isInStock` | boolean |  |
| `Item:SXRlbToxMjg2NjY=.isVetDiet` | boolean |  |
| `Item:SXRlbToxMjg2NjY=.onSpecial` | boolean |  |
| `Item:SXRlbToxMjg2NjY=.__typename` | string |  |
| `Item:SXRlbToxMjg2NjY=.dimensions` | object |  |
| `Item:SXRlbToxMjg2NjY=.infoGroups[]` | object[] |  |

## Chewy Search API

Search Chewy by keyword or listing URL. The default mode is expert and returns the historical listing objects. simple returns short snake_case cards.

`GET | POST https://api.piloterr.com/v2/chewy/search` · **3 credits per request** · [Full reference](https://app.piloterr.com/openapi)

### Request parameters

| Parameter | Type | Required | Description |
|---|---|---|---|
| `query` | string | ✅ | What to search for. A keyword such as salmon kibble, or a Chewy search or category link such as https://www.chewy.com/s?query=dog+food. A product link (a URL that contains /dp/) returns 400. Another website returns 400. |
| `page` | number | — | Which page to fetch, starting at 1. Leave this empty for page 1. If query is a listing link that already has page=2, this value replaces that page. In simple mode, pagination.page is this page and pagination.next is the … |
| `mode` | string | — | Which JSON to return. Default expert. |
| `return_page_source` | boolean | — | Set to true to get the rendered HTML in result instead of JSON. Default false. The string false stays false and still returns JSON. |

### Python example

```python
import json
import os
import requests

response = requests.get(
    "https://api.piloterr.com/v2/chewy/search",
    headers={"x-api-key": os.environ["PILOTERR_API_KEY"]},
    params={
        "query": "salmon kibble",
    },
    timeout=120,
)
response.raise_for_status()
data = response.json()

print(json.dumps(data, indent=2, ensure_ascii=False)[:2000])
```

### TypeScript example

```typescript
type ChewySearch = {
  results?: {
    ppu?: string;
    href?: string;
    name?: string;
    image?: string;
    is_ad?: boolean;
    is_atf?: boolean;
    is_btf?: boolean;
    is_new?: boolean;
    rating?: number;
    is_deal?: boolean;
    in_stock?: boolean;
    is_fresh?: boolean;
    is_bundle?: boolean;
    is_frozen?: boolean;
    is_pb_fresh?: boolean;
    offer_price?: string;
    part_number?: string;
    ad_placement?: number;
    bundle_title?: unknown;
    is_gift_card?: boolean;
    is_live_feed?: boolean;
    is_smart_pak?: boolean;
    key_benefits?: unknown[];
    manufacturer?: string;
    rating_count?: number;
    [key: string]: unknown;
  }[];
};

const params = new URLSearchParams({
  "query": "salmon kibble",
});

const response = await fetch(`https://api.piloterr.com/v2/chewy/search?${params}`, {
  headers: { "x-api-key": process.env.PILOTERR_API_KEY! },
});
if (!response.ok) throw new Error(`Piloterr error ${response.status}: ${await response.text()}`);

const data = (await response.json()) as ChewySearch;

console.log(JSON.stringify(data, null, 2).slice(0, 2000));
```

<details>
<summary><b>POST variant</b></summary>

```http
POST https://api.piloterr.com/v2/chewy/search
x-api-key: YOUR_API_KEY
Content-Type: application/json

{"query": "salmon kibble"}
```
</details>

### Output example

Example response from the API reference, abridged — real values depend on the page you scrape.

```json
{
  "results": [
    {
      "ppu": "$2.59/lb",
      "href": "https://www.chewy.com/api/event/p/sar/click?adsOrigin=aspen2&id=238a99cdbce84f4a97e766531a139158&x=H4sIAAAAAAAA_6VYWZOiyhL-Lzw7PVCASr-ccG…",
      "name": "Purina Pro Plan Adult Sensitive Skin & Stomach Salmon & Rice Formula Dry Dog Food, 30-lb bag",
      "image": "https://image.chewy.com/catalog/general/images/moe/0671ffce-cb9e-7b85-8000-c4f526193d1c,1",
      "is_ad": true,
      "is_atf": true,
      "is_btf": false,
      "is_new": false,
      "rating": 4.5068,
      "is_deal": false,
      "in_stock": true,
      "is_fresh": false,
      "is_bundle": false,
      "is_frozen": false,
      "is_pb_fresh": false,
      "offer_price": "77.48",
      "part_number": "101143",
      "ad_placement": 0,
      "bundle_title": null,
      "is_gift_card": false,
      "is_live_feed": false,
      "is_smart_pak": false,
      "key_benefits": [],
      "manufacturer": "Purina Pro Plan",
      "rating_count": 23711
    }
  ]
}
```

### Response fields

| Field | Type | Description |
|---|---|---|
| `results[]` | object[] |  |
| `results[].ppu` | string |  |
| `results[].href` | string |  |
| `results[].name` | string |  |
| `results[].image` | string |  |
| `results[].is_ad` | boolean |  |
| `results[].is_atf` | boolean |  |
| `results[].is_btf` | boolean |  |
| `results[].is_new` | boolean |  |
| `results[].rating` | number |  |
| `results[].is_deal` | boolean |  |
| `results[].in_stock` | boolean |  |
| `results[].is_fresh` | boolean |  |
| `results[].is_bundle` | boolean |  |
| `results[].is_frozen` | boolean |  |
| `results[].is_pb_fresh` | boolean |  |
| `results[].offer_price` | string |  |
| `results[].part_number` | string |  |
| `results[].ad_placement` | integer |  |
| `results[].bundle_title` | object |  |
| `results[].is_gift_card` | boolean |  |
| `results[].is_live_feed` | boolean |  |
| `results[].is_smart_pak` | boolean |  |
| `results[].key_benefits` | any[] |  |
| `results[].manufacturer` | string |  |

## Code examples in other languages

Ready-to-run examples live in the [`examples/`](examples) folder. Each one reads your key from the `PILOTERR_API_KEY` environment variable.

| Language | Product | Search |
|---|---|---|
| cURL (Bash) | [`product`](examples/curl/product.sh) | [`search`](examples/curl/search.sh) |
| PHP | [`product`](examples/php/product.php) | [`search`](examples/php/search.php) |
| C# | [`product`](examples/csharp/Product.cs) | [`search`](examples/csharp/Search.cs) |
| Go | [`product`](examples/go/product.go) | [`search`](examples/go/search.go) |
| Java | [`product`](examples/java/ProductExample.java) | [`search`](examples/java/SearchExample.java) |
| Ruby | [`product`](examples/ruby/product.rb) | [`search`](examples/ruby/search.rb) |
| Node.js | [`product`](examples/nodejs/product.mjs) | [`search`](examples/nodejs/search.mjs) |

## Practical use cases

- **Price monitoring** — Track prices, promotions and availability over time to react to competitors.
- **Assortment & catalog tracking** — Follow new products, delisted items and category changes.
- **Competitor analysis** — Benchmark ranges, brands and positioning across retailers.
- **Product research** — Spot best-sellers and trends from search results.
- **Catalog enrichment** — Pull titles, images and attributes into your PIM or marketplace listings.

## Why Piloterr?

- **No infrastructure** — no proxies, headless browsers or CAPTCHA solving to run yourself.
- **Structured JSON** — stable, documented fields instead of brittle HTML selectors.
- **Pay per request** — transparent credit cost per endpoint, failed requests are retried for you.
- **One API key, hundreds of sources** — Chewy plus many other e-commerce, search and company data endpoints in the [Piloterr library](https://www.piloterr.com/library).
- **Any language** — plain HTTPS + JSON, with examples for Python, TypeScript, cURL, PHP, C#, Go, Java, Ruby and Node.js.

## FAQ

### Is it legal to scrape Chewy?

Collecting publicly available data is generally allowed in many jurisdictions, but rules depend on your country, the data you collect and how you use it. Avoid personal data unless you have a lawful basis, respect the website's terms where they apply, and get legal advice for your specific use case. This is not legal advice.

### Do I need proxies or a headless browser?

No. Piloterr handles rendering, proxy rotation and retries on its side. You only send an HTTPS request with your `x-api-key` header and receive JSON.

### How much does a request cost?

Credits per call: `/v2/chewy/product` **3**, `/v2/chewy/search` **3**. See the [Piloterr website](https://www.piloterr.com) for plans.

### What data does the Chewy API return?

Each endpoint returns structured JSON: **Chewy Product** — `Item:SXRlbToxMjg2NjY=`, `Item:SXRlbToxMjg2NjY=.id`, `Item:SXRlbToxMjg2NjY=.gtin`, `Item:SXRlbToxMjg2NjY=.isRx`, `Item:SXRlbToxMjg2NjY=.name`, `Item:SXRlbToxMjg2NjY=.uses`; **Chewy Search** — `results[]`, `results[].ppu`, `results[].href`, `results[].name`, `results[].image`, `results[].is_ad`.

### How do I paginate Chewy results?

Use the `page` parameter and keep requesting while the response indicates more results.

### Can I get the raw HTML instead of JSON?

Yes. Set `return_page_source=true` and the response becomes `{"result": "..."}` with the page source.

### Which languages are supported?

Any language that can make an HTTP request. This README shows Python and TypeScript; the [`examples/`](examples) folder contains cURL, PHP, C#, Go, Java, Ruby and Node.js.

## Related scrapers

- [About You Scraper API](https://github.com/piloterr/aboutyou-scraper)
- [Action Scraper API](https://github.com/piloterr/action-scraper)
- [Aldi Scraper API](https://github.com/piloterr/aldi-scraper)
- [Alibaba Scraper API](https://github.com/piloterr/alibaba-scraper)
- [AliExpress Scraper API](https://github.com/piloterr/aliexpress-scraper)
- [Allegro Scraper API](https://github.com/piloterr/allegro-scraper)
- [All Piloterr scrapers on GitHub](https://github.com/piloterr)

## Support

- 💬 Join the [Piloterr Discord](https://discord.gg/CFj3ph8aHU) to ask questions and share what you build.
- 📚 Browse the [API reference (OpenAPI)](https://app.piloterr.com/openapi) and the [Piloterr library](https://www.piloterr.com/library).
- 🔑 [Get your API key](https://app.piloterr.com).

---

<p align="center">
  <a href="https://www.piloterr.com">
    <picture>
      <source media="(prefers-color-scheme: dark)" srcset="images/logo-dark.svg">
      <img src="images/logo.svg" alt="Piloterr" height="32">
    </picture>
  </a>
  <br>
  <sub>Built by <a href="https://www.piloterr.com">Piloterr</a> — web scraping APIs for e-commerce, search, real estate and more, one API key.</sub>
</p>

<sub>Chewy is a trademark of its respective owner. This repository is not affiliated with or endorsed by Chewy. Examples are released under the MIT license.</sub>
