<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="theme-color" content="#f5f7f1">
    <meta name="description" content="Fresh picks and everyday pantry favourites from Perishable Shop.">
    <title>Perishable Shop | Fresh picks for your table</title>
    <style>
        :root {
            --ink: #26352a;
            --muted: #6d776d;
            --green: #42634a;
            --green-dark: #304b37;
            --cream: #f5f7f1;
            --line: #e4e9df;
            --white: #fff;
        }

        * { box-sizing: border-box; }
        html { scroll-behavior: smooth; }
        body {
            margin: 0;
            color: var(--ink);
            background: var(--cream);
            font-family: Inter, ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
            -webkit-font-smoothing: antialiased;
        }
        a { color: inherit; text-decoration: none; }
        button, input { font: inherit; }
        .topline { background: var(--green-dark); color: #edf4e9; text-align: center; padding: 9px 16px; font-size: 12px; letter-spacing: .04em; }
        .site-header { background: rgba(255,255,255,.92); border-bottom: 1px solid var(--line); position: sticky; top: 0; z-index: 5; backdrop-filter: blur(12px); }
        .nav { width: min(1160px, calc(100% - 40px)); min-height: 76px; margin: auto; display: flex; align-items: center; justify-content: space-between; gap: 24px; }
        .brand { display: inline-flex; align-items: center; gap: 10px; font-weight: 800; font-size: 19px; letter-spacing: -.04em; }
        .brand-mark { width: 36px; height: 36px; display: grid; place-items: center; border-radius: 12px; background: var(--green); color: white; }
        .brand-mark svg { width: 21px; height: 21px; }
        .nav-right { display: flex; align-items: center; gap: 25px; color: #4f5b51; font-size: 14px; }
        .nav-right a:hover { color: var(--green); }
        .nav-user { color: var(--muted); }
        .button { min-height: 46px; display: inline-flex; align-items: center; justify-content: center; gap: 9px; border: 0; border-radius: 999px; padding: 0 20px; font-weight: 700; font-size: 14px; transition: transform .18s ease, background .18s ease; cursor: pointer; }
        .button:hover { transform: translateY(-1px); }
        .button-primary { background: var(--green); color: white; }
        .button-primary:hover { background: var(--green-dark); color: white; }
        .button-light { background: white; color: var(--ink); box-shadow: 0 8px 24px rgba(32,54,37,.08); }
        .button-light:hover { background: #f4f7ee; }
        .hero-wrap { padding: 36px 20px 26px; }
        .hero { position: relative; overflow: hidden; width: min(1160px, 100%); min-height: 408px; margin: auto; border-radius: 28px; background: #e3eade; display: grid; grid-template-columns: 1.04fr .96fr; }
        .hero-copy { position: relative; z-index: 1; padding: clamp(36px, 6vw, 76px); display: flex; flex-direction: column; justify-content: center; align-items: flex-start; }
        .eyebrow { display: inline-flex; align-items: center; gap: 8px; color: var(--green); font-size: 11px; font-weight: 800; letter-spacing: .13em; text-transform: uppercase; }
        .eyebrow-dot { width: 7px; height: 7px; background: #80a94c; border-radius: 50%; }
        h1 { max-width: 490px; margin: 18px 0 14px; font-family: Georgia, "Times New Roman", serif; font-size: clamp(42px, 5.7vw, 68px); font-weight: 500; line-height: .99; letter-spacing: -.055em; }
        .hero-copy p { max-width: 410px; margin: 0 0 25px; color: #50634f; font-size: 16px; line-height: 1.7; }
        .hero-actions { display: flex; flex-wrap: wrap; align-items: center; gap: 11px; }
        .hero-visual { min-height: 408px; background-color: #cad8c4; background-image: url("https://images.unsplash.com/photo-1542838132-92c53300491e?auto=format&fit=crop&w=1400&q=85"); background-position: center; background-size: cover; background-blend-mode: luminosity; }
        .hero-note { position: absolute; right: 24px; bottom: 24px; padding: 13px 16px; border-radius: 14px; background: rgba(255,255,255,.93); box-shadow: 0 10px 28px rgba(28,50,30,.12); font-size: 12px; font-weight: 700; }
        .hero-note span { display: block; margin-top: 3px; color: var(--muted); font-weight: 500; }
        .benefits { width: min(1060px, calc(100% - 40px)); margin: 0 auto; display: grid; grid-template-columns: repeat(3, 1fr); padding: 18px 0 37px; }
        .benefit { display: flex; align-items: center; justify-content: center; gap: 11px; padding: 8px 14px; color: #526252; font-size: 13px; }
        .benefit + .benefit { border-left: 1px solid #dfe4d7; }
        .benefit-icon { width: 34px; height: 34px; display: grid; place-items: center; border-radius: 50%; background: #e6ecdf; color: var(--green); font-size: 16px; }
        .benefit strong { display: block; color: var(--ink); font-size: 13px; }
        .catalog { width: min(1160px, calc(100% - 40px)); margin: 0 auto; padding: 20px 0 84px; }
        .section-head { display: flex; align-items: end; justify-content: space-between; gap: 24px; margin-bottom: 25px; }
        .section-kicker { margin: 0 0 8px; color: var(--green); font-size: 11px; font-weight: 800; letter-spacing: .13em; text-transform: uppercase; }
        h2 { margin: 0; font-family: Georgia, "Times New Roman", serif; font-size: clamp(30px, 4vw, 42px); font-weight: 500; letter-spacing: -.04em; }
        .section-subtitle { margin: 9px 0 0; color: var(--muted); font-size: 14px; }
        .search { width: min(280px, 100%); height: 46px; display: flex; align-items: center; gap: 9px; border: 1px solid var(--line); border-radius: 999px; padding: 0 15px; background: white; color: #778078; }
        .search svg { width: 17px; flex: 0 0 auto; }
        .search input { width: 100%; border: 0; outline: 0; background: transparent; color: var(--ink); font-size: 13px; }
        .filters { display: flex; flex-wrap: wrap; gap: 8px; margin: 0 0 24px; }
        .filter { border: 1px solid var(--line); border-radius: 999px; padding: 9px 15px; background: white; color: #536054; font-size: 12px; font-weight: 700; cursor: pointer; transition: .18s ease; }
        .filter:hover, .filter.active { background: var(--green); border-color: var(--green); color: white; }
        .product-grid { display: grid; grid-template-columns: repeat(4, minmax(0, 1fr)); gap: 18px; }
        .product-card { min-width: 0; overflow: hidden; border: 1px solid #eceee7; border-radius: 19px; background: white; box-shadow: 0 5px 18px rgba(28,48,32,.035); transition: transform .2s ease, box-shadow .2s ease; }
        .product-card:hover { transform: translateY(-4px); box-shadow: 0 15px 35px rgba(28,48,32,.1); }
        .product-image-wrap { position: relative; height: 205px; overflow: hidden; background: #f0f2e9; }
        .product-image { width: 100%; height: 100%; display: block; object-fit: cover; transition: transform .35s ease; }
        .product-card:hover .product-image { transform: scale(1.04); }
        .stock { position: absolute; top: 12px; left: 12px; border-radius: 999px; padding: 6px 9px; background: rgba(255,255,255,.93); color: var(--green); font-size: 10px; font-weight: 800; }
        .stock.out { color: #8a5144; }
        .product-info { padding: 16px; }
        .product-category { margin: 0 0 7px; color: #74806f; font-size: 10px; font-weight: 800; letter-spacing: .1em; text-transform: uppercase; }
        .product-name { margin: 0; color: var(--ink); font-family: Georgia, "Times New Roman", serif; font-size: 21px; font-weight: 500; letter-spacing: -.025em; }
        .product-description { min-height: 40px; margin: 8px 0 17px; color: var(--muted); font-size: 12px; line-height: 1.6; }
        .product-bottom { display: flex; align-items: center; justify-content: space-between; gap: 10px; border-top: 1px solid #eff0eb; padding-top: 13px; }
        .price-label { display: block; color: #7d867e; font-size: 10px; }
        .price { color: var(--green-dark); font-size: 18px; font-weight: 800; }
        .shop-link { display: inline-flex; align-items: center; gap: 6px; color: var(--green); font-size: 12px; font-weight: 800; }
        .shop-link:hover { color: var(--green-dark); }
        .empty { grid-column: 1/-1; border: 1px dashed #d6dccd; border-radius: 18px; padding: 40px; color: var(--muted); text-align: center; background: rgba(255,255,255,.6); }
        .empty h3 { margin: 0 0 8px; color: var(--ink); font-family: Georgia, "Times New Roman", serif; font-size: 24px; font-weight: 500; }
        .site-footer { border-top: 1px solid var(--line); background: #edf1e8; }
        .footer-inner { width: min(1160px, calc(100% - 40px)); min-height: 86px; margin: auto; display: flex; align-items: center; justify-content: space-between; gap: 20px; color: #6d776e; font-size: 12px; }
        .footer-brand { color: var(--ink); font-weight: 800; }
        [hidden] { display: none !important; }
        @media (max-width: 900px) {
            .hero { grid-template-columns: 1fr .78fr; }
            .hero-copy { padding: 42px; }
            .product-grid { grid-template-columns: repeat(3, minmax(0, 1fr)); }
        }
        @media (max-width: 680px) {
            .nav { width: calc(100% - 28px); min-height: 66px; }
            .nav-right { gap: 14px; font-size: 13px; }
            .nav-user { display: none; }
            .hero-wrap { padding: 18px 14px 12px; }
            .hero { display: block; min-height: 0; border-radius: 22px; }
            .hero-copy { padding: 35px 25px 27px; }
            h1 { max-width: 390px; font-size: clamp(43px, 12vw, 60px); }
            .hero-copy p { font-size: 14px; }
            .hero-visual { min-height: 205px; }
            .hero-note { right: 14px; bottom: 14px; }
            .benefits { width: calc(100% - 28px); padding: 14px 0 25px; }
            .benefit { flex-direction: column; gap: 6px; padding: 5px; text-align: center; font-size: 10px; }
            .benefit strong { font-size: 11px; }
            .benefit-icon { width: 30px; height: 30px; }
            .catalog { width: calc(100% - 28px); padding: 15px 0 58px; }
            .section-head { display: block; margin-bottom: 18px; }
            .search { width: 100%; margin-top: 17px; }
            .filters { flex-wrap: nowrap; overflow-x: auto; padding-bottom: 5px; scrollbar-width: thin; }
            .filter { flex: 0 0 auto; }
            .product-grid { grid-template-columns: repeat(2, minmax(0, 1fr)); gap: 11px; }
            .product-image-wrap { height: 150px; }
            .product-info { padding: 12px; }
            .product-name { font-size: 18px; }
            .product-description { min-height: 54px; font-size: 11px; }
            .product-bottom { align-items: end; }
            .shop-link { font-size: 11px; }
            .footer-inner { width: calc(100% - 28px); min-height: 76px; }
        }
        @media (max-width: 370px) {
            .brand { font-size: 16px; }
            .nav-right { gap: 10px; }
            .button { padding: 0 15px; font-size: 13px; }
            .product-grid { grid-template-columns: 1fr; }
            .product-image-wrap { height: 205px; }
            .product-description { min-height: 0; }
        }
        @media (prefers-reduced-motion: reduce) {
            *, *::before, *::after { scroll-behavior: auto !important; transition-duration: .01ms !important; }
        }
    </style>
</head>
<body>
    <div class="topline">A little more fresh in every day</div>
    <header class="site-header">
        <nav class="nav" aria-label="Main navigation">
            <a class="brand" href="/" aria-label="Perishable Shop home">
                <span class="brand-mark" aria-hidden="true">
                    <svg viewBox="0 0 24 24" fill="none"><path d="M12 21c-4.7-2.6-7-6.3-7-10.8 4.2-.3 7.1 1.8 7.2 5.4C12.4 11 15.2 8.5 20 8c.3 5.9-2.5 10.6-8 13Z" stroke="currentColor" stroke-width="1.8" stroke-linejoin="round"/><path d="M12 20c-.2-4.7-1.8-7.8-4.5-9.8" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"/></svg>
                </span>
                <span>Perishable Shop</span>
            </a>
            <div class="nav-right">
                <span class="nav-user">Hi, <c:out value="${username}" /></span>
                <a href="/profileDisplay">Profile</a>
                <a href="/logout">Log out</a>
            </div>
        </nav>
    </header>

    <main>
        <section class="hero-wrap" aria-labelledby="hero-title">
            <div class="hero">
                <div class="hero-copy">
                    <span class="eyebrow"><span class="eyebrow-dot"></span> Good food, thoughtfully picked</span>
                    <h1 id="hero-title">Fresh picks for your table.</h1>
                    <p>From crisp produce to pantry staples, find everyday favourites for whatever you’re cooking.</p>
                    <div class="hero-actions">
                        <a class="button button-primary" href="#shop">Explore the selection <span aria-hidden="true">→</span></a>
                        <a class="button button-light" href="/user/products">Browse all items</a>
                    </div>
                </div>
                <div class="hero-visual" role="img" aria-label="A colorful market display of fresh vegetables"></div>
                <div class="hero-note">Everyday essentials<span>Fresh ideas for your next meal</span></div>
            </div>
        </section>

        <section class="benefits" aria-label="Shop highlights">
            <div class="benefit"><span class="benefit-icon" aria-hidden="true">✳</span><span><strong>Fresh finds</strong>Something good for today</span></div>
            <div class="benefit"><span class="benefit-icon" aria-hidden="true">⌂</span><span><strong>Everyday staples</strong>Stock up on the basics</span></div>
            <div class="benefit"><span class="benefit-icon" aria-hidden="true">♡</span><span><strong>Made for your table</strong>Find your next favourite</span></div>
        </section>

        <section class="catalog" id="shop" aria-labelledby="catalog-title">
            <div class="section-head">
                <div>
                    <p class="section-kicker">From the shelves</p>
                    <h2 id="catalog-title">A fresh place to start</h2>
                    <p class="section-subtitle">Browse the current selection and find something for your next meal.</p>
                </div>
                <label class="search">
                    <svg viewBox="0 0 24 24" fill="none" aria-hidden="true"><circle cx="10.8" cy="10.8" r="6.8" stroke="currentColor" stroke-width="1.8"/><path d="m16 16 4.5 4.5" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"/></svg>
                    <input id="product-search" type="search" placeholder="Search the selection" aria-label="Search products">
                </label>
            </div>

            <div class="filters" role="group" aria-label="Filter products by category">
                <button class="filter active" type="button" data-filter="all" aria-pressed="true">Everything</button>
                <button class="filter" type="button" data-filter="fruits" aria-pressed="false">Fruit</button>
                <button class="filter" type="button" data-filter="vegetables" aria-pressed="false">Vegetables</button>
                <button class="filter" type="button" data-filter="dairy" aria-pressed="false">Dairy</button>
                <button class="filter" type="button" data-filter="bakery" aria-pressed="false">Bakery</button>
                <button class="filter" type="button" data-filter="pantry" aria-pressed="false">Pantry</button>
                <button class="filter" type="button" data-filter="beverages" aria-pressed="false">Drinks</button>
                <button class="filter" type="button" data-filter="sweets" aria-pressed="false">Treats</button>
            </div>

            <div class="product-grid" id="product-grid" aria-live="polite">
                <c:choose>
                    <c:when test="${not empty products}">
                        <c:forEach var="product" items="${products}">
                            <article class="product-card" data-category="<c:out value='${product.category.name}'/>" data-name="<c:out value='${product.name}'/>" data-description="<c:out value='${product.description}'/>">
                                <div class="product-image-wrap">
                                    <c:choose>
                                        <c:when test="${not empty product.image}">
                                            <img class="product-image" src="<c:out value='${product.image}'/>" alt="<c:out value='${product.name}'/>" loading="lazy">
                                        </c:when>
                                        <c:otherwise><div class="product-image" role="img" aria-label="Product image unavailable"></div></c:otherwise>
                                    </c:choose>
                                    <span class="stock ${product.quantity le 0 ? 'out' : ''}"><c:choose><c:when test="${product.quantity gt 0}">In stock</c:when><c:otherwise>Out of stock</c:otherwise></c:choose></span>
                                </div>
                                <div class="product-info">
                                    <p class="product-category"><c:out value="${product.category.name}" /></p>
                                    <h3 class="product-name"><c:out value="${product.name}" /></h3>
                                    <p class="product-description"><c:out value="${product.description}" /></p>
                                    <div class="product-bottom">
                                        <span><span class="price-label">Price</span><span class="price"><c:out value="${product.price}" /></span></span>
                                        <a class="shop-link" href="/user/products">View item <span aria-hidden="true">↗</span></a>
                                    </div>
                                </div>
                            </article>
                        </c:forEach>
                        <div class="empty" id="no-results" hidden><h3>No matches just yet</h3><p>Try another search or choose a different category.</p></div>
                    </c:when>
                    <c:otherwise>
                        <div class="empty"><h3>The shelves are getting ready</h3><p>There aren’t any products to show right now. Please check back soon.</p></div>
                    </c:otherwise>
                </c:choose>
            </div>
        </section>
    </main>

    <footer class="site-footer">
        <div class="footer-inner"><a class="footer-brand" href="/">Perishable Shop</a><span>Good food starts with good ingredients.</span></div>
    </footer>

    <script>
        (function () {
            var activeCategory = 'all';
            var search = document.getElementById('product-search');
            var cards = Array.prototype.slice.call(document.querySelectorAll('.product-card'));
            var empty = document.getElementById('no-results');
            var buttons = Array.prototype.slice.call(document.querySelectorAll('.filter'));

            function updateProducts() {
                var query = search ? search.value.trim().toLowerCase() : '';
                var visible = 0;
                cards.forEach(function (card) {
                    var category = (card.getAttribute('data-category') || '').toLowerCase();
                    var text = ((card.getAttribute('data-name') || '') + ' ' +
                        (card.getAttribute('data-description') || '') + ' ' + category).toLowerCase();
                    var matches = (activeCategory === 'all' || category.indexOf(activeCategory) !== -1) && text.indexOf(query) !== -1;
                    card.hidden = !matches;
                    if (matches) visible++;
                });
                if (empty) empty.hidden = visible !== 0;
            }

            buttons.forEach(function (button) {
                button.addEventListener('click', function () {
                    activeCategory = button.getAttribute('data-filter');
                    buttons.forEach(function (item) {
                        var selected = item === button;
                        item.classList.toggle('active', selected);
                        item.setAttribute('aria-pressed', selected ? 'true' : 'false');
                    });
                    updateProducts();
                });
            });
            if (search) search.addEventListener('input', updateProducts);
        }());
    </script>
</body>
</html>
