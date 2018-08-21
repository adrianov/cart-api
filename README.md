# Cart Api

Demo Cart API

Generated with [Raygun](https://github.com/carbonfive/raygun).

# Development

## Getting Started

### Requirements

To run the specs or fire up the server, be sure you have these installed (and running):

* Ruby 2.4 (see [.ruby-version](.ruby-version)).

### First Time Setup

#### `bin/setup`

### Usage
```
$ http GET localhost:3000/api/products
HTTP/1.1 200 OK
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 163
Content-Type: application/json
ETag: W/"a0390d45a8e1e5510a8e68cf73c08b59"
X-Request-Id: 3f21c2d5-4f1f-42e4-a963-4e3c686a17a2
X-Runtime: 0.002264

{
    "data": [
        {
            "description": "Product Description",
            "id": 1,
            "name": "Product #1",
            "price": 50
        },
        {
            "description": "Product Description",
            "id": 2,
            "name": "Product #2",
            "price": 150
        }
    ]
}

$ http POST localhost:3000/api/cart product_id=1 quantity=2
HTTP/1.1 201 Created
Cache-Control: no-cache
Content-Length: 0
Content-Type: text/plain
X-Request-Id: 883fcc13-9592-4a6f-a84f-b6ed392420ca
X-Runtime: 0.002660



$ http DELETE localhost:3000/api/cart/1
HTTP/1.1 204 No Content
Cache-Control: no-cache
Content-Type: text/plain
X-Request-Id: c16ffb18-f289-433e-9713-d696cc09bb4f
X-Runtime: 0.001111



$ http GET localhost:3000/api/cart
HTTP/1.1 200 OK
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 79
Content-Type: application/json
ETag: W/"b4091c4bf9428639187683ebc6f39e62"
X-Request-Id: d048d309-ba6e-4d2f-8a09-6a005a4533ff
X-Runtime: 0.001272

{
    "products": [
        {
            "id": 1,
            "quantity": 1,
            "sum": 50
        }
    ],
    "products_count": 1,
    "total_sum": 50
}

$ http POST localhost:3000/api/cart product_id=2 quantity=2
HTTP/1.1 201 Created
Cache-Control: no-cache
Content-Length: 0
Content-Type: text/plain
X-Request-Id: 602402d4-3cea-4acc-ba7f-73ef23679b67
X-Runtime: 0.001379



$ http GET localhost:3000/api/cart
HTTP/1.1 200 OK
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 112
Content-Type: application/json
ETag: W/"a74578d45ca353b37814e3d37e70f91c"
X-Request-Id: 28be701f-44d2-4dd6-8a66-57018d1a6a3f
X-Runtime: 0.001199

{
    "products": [
        {
            "id": 1,
            "quantity": 1,
            "sum": 50
        },
        {
            "id": 2,
            "quantity": 2,
            "sum": 300
        }
    ],
    "products_count": 3,
    "total_sum": 350
}

```
