<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ElectroTech - Venta de Productos Electrónicos</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;700;800&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<style>
:root {
  --ink: #10222f;
  --paper: #eef2f4;
  --card: #ffffff;
  --line: #d5dde2;
  --volt: #1c6dd0;
  --volt-dark: #154f98;
  --signal: #e0a100;
  --ok: #13795b;
  --warn: #b4540a;
}

body {
  font-family: 'Manrope', system-ui, sans-serif;
  background-color: var(--paper);
  color: var(--ink);
  min-height: 100vh;
  display: flex;
  flex-direction: column;
}

main { flex: 1; }

h1, h2, h3, h4, h5 { font-weight: 800; letter-spacing: -.02em; }
.price { font-variant-numeric: tabular-nums; font-weight: 800; }

.topbar { background: var(--ink); }
.brand { font-weight: 800; font-size: 1.3rem; color: #fff; text-decoration: none; }
.brand i { color: var(--signal); }
.btn-cart { border: 2px solid var(--signal); color: var(--signal); font-weight: 700; }
.btn-cart:hover { background: var(--signal); color: var(--ink); }

.hero {
  background: var(--ink);
  color: #fff;
  border-radius: 1rem;
  padding: 3.5rem 2rem;
  margin: 1.5rem 0 2.5rem;
  background-image: linear-gradient(var(--ink), var(--ink)), repeating-linear-gradient(90deg, transparent 0 39px, rgba(255,255,255,.05) 39px 40px);
  position: relative;
  overflow: hidden;
  box-shadow: 0 10px 30px rgba(16, 34, 47, 0.2);
}
.hero::after {
  content: "";
  position: absolute;
  inset: 0;
  pointer-events: none;
  background: repeating-linear-gradient(90deg, transparent 0 47px, rgba(255,255,255,.03) 47px 48px),
              repeating-linear-gradient(0deg, transparent 0 47px, rgba(255,255,255,.03) 47px 48px);
}
.hero > * { position: relative; z-index: 1; }
.hero h1 { font-size: clamp(2.2rem, 5vw, 3.5rem); max-width: 20ch; line-height: 1.15; }
.hero p { color: #b8c7d1; max-width: 55ch; font-size: 1.1rem; }
.search { max-width: 480px; }
.search .form-control { border: 0; padding: .8rem 1.2rem; font-weight: 500; font-size: 1rem; }
.search .input-group-text { border: 0; background: #fff; color: var(--ink); }

.chip {
  border: 2px solid var(--line);
  background: var(--card);
  color: var(--ink);
  font-weight: 700;
  border-radius: 2rem;
  padding: .4rem 1.2rem;
  font-size: .9rem;
  transition: all .2s ease;
  cursor: pointer;
}
.chip:hover { border-color: var(--volt); color: var(--volt); }
.chip.active { background: var(--ink); border-color: var(--ink); color: #fff; }

.product {
  background: var(--card);
  border: 1px solid var(--line);
  border-radius: .85rem;
  height: 100%;
  display: flex;
  flex-direction: column;
  overflow: hidden;
  transition: transform .2s ease, box-shadow .2s ease;
}
.product:hover {
  transform: translateY(-4px);
  box-shadow: 0 12px 28px rgba(16,34,47,.12);
}

.product .thumb {
  height: 180px;
  width: 100%;
  position: relative;
  background: #ffffff;
  overflow: hidden;
  display: flex;
  align-items: center;
  justify-content: center;
}
.product .thumb img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform .3s ease;
}
.product:hover .thumb img {
  transform: scale(1.05);
}

.product .body { padding: 1.25rem; display: flex; flex-direction: column; flex: 1; }
.product .brand-tag { font-size: .8rem; font-weight: 800; color: #55697a; text-transform: uppercase; letter-spacing: .04em; }
.stock-ok { color: var(--ok); }
.stock-low { color: var(--warn); }
.stock-out { color: #a31d1d; }

.btn-add {
  background: var(--volt);
  color: #fff;
  font-weight: 700;
  border: 0;
  padding: .6rem 1rem;
  border-radius: .5rem;
  transition: background .2s ease;
}
.btn-add:hover { background: var(--volt-dark); color: #fff; }
.btn-add:disabled { background: #9aa9b5; cursor: not-allowed; }

.combo {
  background: var(--card);
  border: 2px solid var(--ink);
  border-radius: .85rem;
  padding: 1.5rem;
  height: 100%;
}
.combo .save {
  background: var(--signal);
  color: var(--ink);
  font-weight: 800;
  border-radius: .4rem;
  padding: .2rem .6rem;
  font-size: .85rem;
}
.combo li { padding: .3rem 0; font-weight: 500; }

.cart-line {
  display: grid;
  grid-template-columns: 1fr auto;
  gap: .25rem .75rem;
  padding: .8rem 0;
  border-bottom: 1px solid var(--line);
}
.qty { display: inline-flex; align-items: center; border: 1px solid var(--line); border-radius: .4rem; }
.qty button { border: 0; background: none; width: 2rem; height: 2rem; font-weight: 800; }
.qty span { min-width: 2rem; text-align: center; font-weight: 700; }

.toast-container { z-index: 2000; }
footer { background: var(--ink); color: #b8c7d1; margin-top: auto; }
</style>
</head>
<body>

<nav class="topbar sticky-top py-2">
  <div class="container d-flex align-items-center justify-content-between">
    <a class="brand" href="#"><i class="fa-solid fa-bolt"></i> ElectroTech</a>
    <div class="d-flex align-items-center gap-3">
      <a class="text-white text-decoration-none d-none d-sm-inline fw-semibold" href="#productos">Productos</a>
      <a class="text-white text-decoration-none d-none d-sm-inline fw-semibold" href="#combos">Combos</a>
      <button class="btn btn-cart position-relative" data-bs-toggle="offcanvas" data-bs-target="#carritoOffcanvas" aria-label="Abrir carrito">
        <i class="fa-solid fa-cart-shopping me-1"></i> Carrito
        <span id="contador-carrito" class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">0</span>
      </button>
    </div>
  </div>
</nav>

<main class="container">
  <section class="hero">
    <h1>Tecnología completa para trabajar, jugar y crear</h1>
    <p class="mt-3 mb-4">Notebooks, celulares y todos los accesorios indispensables incluidos para mejorar tu experiencia de compra.</p>
    <div class="input-group search">
      <span class="input-group-text"><i class="fa-solid fa-magnifying-glass"></i></span>
      <input id="buscador" type="search" class="form-control" placeholder="Buscar por nombre, marca o accesorio..." aria-label="Buscar productos">
    </div>
  </section>

  <section id="productos" class="mb-5">
    <div class="d-flex flex-wrap align-items-center justify-content-between gap-3 mb-3">
      <h2 class="h3 mb-0">Catálogo Individual</h2>
      <select id="orden" class="form-select w-auto" aria-label="Ordenar productos">
        <option value="">Ordenar por</option>
        <option value="asc">Precio: menor a mayor</option>
        <option value="desc">Precio: mayor a menor</option>
        <option value="nombre">Nombre</option>
      </select>
    </div>
    <div id="filtros" class="d-flex flex-wrap gap-2 mb-4"></div>
    <div class="row row-cols-1 row-cols-sm-2 row-cols-lg-3 g-4" id="lista-productos"></div>
    <p id="sin-resultados" class="text-center text-muted py-5 d-none">No encontramos productos con ese filtro.</p>
  </section>

  <section id="combos" class="mb-5">
    <h2 class="h3 mb-3">Kits & Combos Promocionales</h2>
    <div class="row g-4" id="lista-combos"></div>
  </section>
</main>

<footer class="py-4 text-center">
  <div class="container">&copy; 2026 ElectroTech. Proyecto de Base de Datos y Web.</div>
</footer>

<!-- Offcanvas Carrito -->
<div class="offcanvas offcanvas-end" tabindex="-1" id="carritoOffcanvas">
  <div class="offcanvas-header topbar text-white">
    <h5 class="offcanvas-title mb-0"><i class="fa-solid fa-cart-shopping me-2"></i> Tu carrito</h5>
    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" aria-label="Cerrar"></button>
  </div>
  <div class="offcanvas-body d-flex flex-column">
    <div id="items-carrito" class="flex-grow-1"></div>
    <div class="pt-3 border-top">
      <div class="d-flex justify-content-between fs-5 mb-3"><span class="fw-bold">Total</span><span id="total-carrito" class="price">$0</span></div>
      <button id="btn-pagar" class="btn btn-add w-100 py-2" data-bs-toggle="modal" data-bs-target="#checkoutModal">Continuar con la compra</button>
      <button id="btn-vaciar" class="btn btn-link w-100 text-secondary mt-1">Vaciar carrito</button>
    </div>
  </div>
</div>

<!-- Modal Checkout -->
<div class="modal fade" id="checkoutModal" tabindex="-1" aria-labelledby="checkoutTitulo" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <form class="modal-content" id="form-checkout" novalidate>
      <div class="modal-header">
        <h5 class="modal-title" id="checkoutTitulo">Finalizar compra</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
      </div>
      <div class="modal-body" id="checkout-cuerpo">
        <div class="row g-3">
          <div class="col-6"><label class="form-label fw-semibold" for="f-nombre">Nombre</label><input id="f-nombre" class="form-control" required></div>
          <div class="col-6"><label class="form-label fw-semibold" for="f-apellido">Apellido</label><input id="f-apellido" class="form-control" required></div>
          <div class="col-12"><label class="form-label fw-semibold" for="f-email">Email</label><input id="f-email" type="email" class="form-control" required></div>
          <div class="col-12"><label class="form-label fw-semibold" for="f-direccion">Dirección de envío</label><input id="f-direccion" class="form-control" required></div>
          <div class="col-12"><label class="form-label fw-semibold" for="f-metodo">Método de pago</label>
            <select id="f-metodo" class="form-select">
              <option>Mercado Pago</option>
              <option>Tarjeta de crédito</option>
              <option>Tarjeta de débito</option>
              <option>Transferencia bancaria</option>
            </select>
          </div>
        </div>
        <div class="mt-4 pt-3 border-top">
          <h6 class="fw-bold mb-2">Detalle de tu pedido</h6>
          <div id="checkout-resumen-items" class="small text-secondary mb-2"></div>
        </div>
        <div class="d-flex justify-content-between fs-5 mt-3 pt-3 border-top"><span class="fw-bold">Total a pagar</span><span id="checkout-total" class="price"></span></div>
      </div>
      <div class="modal-footer" id="checkout-footer"><button type="submit" class="btn btn-add px-4" id="btn-confirmar-compra">Confirmar compra</button></div>
    </form>
  </div>
</div>

<!-- Toast -->
<div class="toast-container position-fixed bottom-0 end-0 p-3">
  <div id="toast" class="toast text-bg-dark" role="status" aria-live="polite">
    <div class="toast-body" id="toast-msg"></div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
const $ = id => document.getElementById(id);
const money = n => '$' + n.toLocaleString('es-AR');
const prod = id => productos.find(p => p.id === id);

const checkoutCuerpoInicial = $('checkout-cuerpo').innerHTML;
const checkoutFooterInicial = $('checkout-footer').innerHTML;

let categorias = {
  1: { n: 'Notebooks', i: 'fa-laptop' },
  2: { n: 'Celulares', i: 'fa-mobile-screen' },
  3: { n: 'Monitores', i: 'fa-desktop' },
  4: { n: 'Periféricos', i: 'fa-headphones' },
  5: { n: 'Accesorios', i: 'fa-plug' }
};

const imagenesRespaldoWeb = {
  1: "https://images.unsplash.com/photo-1603302576837-37561b2e2302?w=600&auto=format&fit=crop&q=80",
  2: "https://images.unsplash.com/photo-1588872657578-7efd1f1555ed?w=600&auto=format&fit=crop&q=80",
  3: "https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=600&auto=format&fit=crop&q=80",
  4: "https://images.unsplash.com/photo-1598327105666-5b89351aff97?w=600&auto=format&fit=crop&q=80",
  5: "https://images.unsplash.com/photo-1610945265064-0e34e5519bbf?w=600&auto=format&fit=crop&q=80",
  6: "https://images.unsplash.com/photo-1565849904461-04a58ad377e0?w=600&auto=format&fit=crop&q=80",
  7: "https://images.unsplash.com/photo-1695048133142-1a20484d2569?w=600&auto=format&fit=crop&q=80",
  8: "https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?w=600&auto=format&fit=crop&q=80",
  9: "https://images.unsplash.com/photo-1551645120-d70bfe84c826?w=600&auto=format&fit=crop&q=80",
  10: "https://images.unsplash.com/photo-1547082299-de196ea013d6?w=600&auto=format&fit=crop&q=80",
  11: "https://images.unsplash.com/photo-1590658268037-6bf12165a8df?w=600&auto=format&fit=crop&q=80",
  12: "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600&auto=format&fit=crop&q=80",
  13: "https://images.unsplash.com/photo-1615663245857-ac93bb7c39e7?w=600&auto=format&fit=crop&q=80",
  14: "https://images.unsplash.com/photo-1527864550417-7fd91fc51a46?w=600&auto=format&fit=crop&q=80",
  15: "https://images.unsplash.com/photo-1583863788434-e58a36330cf0?w=600&auto=format&fit=crop&q=80",
  16: "https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb?w=600&auto=format&fit=crop&q=80",
  17: "https://images.unsplash.com/photo-1605236453806-6ff36851218e?w=600&auto=format&fit=crop&q=80",
  18: "https://images.unsplash.com/photo-1597872200969-2b65d56bd16b?w=600&auto=format&fit=crop&q=80",
  19: "https://assets.altaventa.cl/sherpa/daa27163-8976-11ef-8ba9-5600051be640.jpeg"
};

let productos = [
  { id: 1, nombre: "Notebook Gamer", descripcion: "Notebook de alto rendimiento para trabajo y gaming", marca: "Lenovo", precio: 1500000, stock: 10, garantia: 12, cat: 1, img: imagenesRespaldoWeb[1] },
  { id: 2, nombre: "Notebook HP 15", descripcion: "Laptop ultraligera Intel Core i5 16GB RAM SSD 512GB", marca: "HP", precio: 1150000, stock: 12, garantia: 12, cat: 1, img: imagenesRespaldoWeb[2] },
  { id: 3, nombre: "MacBook Air M2", descripcion: "Laptop Apple Chip M2 pantalla Retina 13.6 pulgadas", marca: "Apple", precio: 2100000, stock: 6, garantia: 12, cat: 1, img: imagenesRespaldoWeb[3] },
  { id: 4, nombre: "Celular Redmi A3", descripcion: "Smartphone libre con pantalla fluida de 90Hz", marca: "Xiaomi", precio: 900000, stock: 15, garantia: 12, cat: 2, img: imagenesRespaldoWeb[4] },
  { id: 5, nombre: "Samsung Galaxy A55", descripcion: "Smartphone 5G pantalla Super AMOLED 120Hz 128GB", marca: "Samsung", precio: 750000, stock: 12, garantia: 12, cat: 2, img: imagenesRespaldoWeb[5] },
  { id: 6, nombre: "Motorola Moto G84", descripcion: "Celular libre pantalla OLED 256GB RAM 8GB", marca: "Motorola", precio: 520000, stock: 15, garantia: 12, cat: 2, img: imagenesRespaldoWeb[6] },
  { id: 7, nombre: "iPhone 15 128GB", descripcion: "Pantalla Super Retina XDR Chip A16 Bionic cámara 48MP", marca: "Apple", precio: 1850000, stock: 5, garantia: 12, cat: 2, img: imagenesRespaldoWeb[7] },
  { id: 8, nombre: "Monitor Profesional", descripcion: "Monitor IPS 24 pulgadas Full HD", marca: "LG", precio: 500000, stock: 8, garantia: 12, cat: 3, img: imagenesRespaldoWeb[8] },
  { id: 9, nombre: "Monitor Gaming 144Hz", descripcion: "Monitor curvo 27 pulgadas Full HD 1ms Freesync", marca: "Samsung", precio: 680000, stock: 10, garantia: 12, cat: 3, img: imagenesRespaldoWeb[9] },
  { id: 10, nombre: "Monitor UltraWide 34\"", descripcion: "Monitor panorámico 2K para productividad y edición", marca: "LG", precio: 920000, stock: 5, garantia: 12, cat: 3, img: imagenesRespaldoWeb[10] },
  { id: 11, nombre: "Auriculares Inalámbricos TWS", descripcion: "Auriculares Bluetooth 5.3 con estuche de carga", marca: "Xiaomi", precio: 45000, stock: 35, garantia: 12, cat: 4, img: imagenesRespaldoWeb[11] },
  { id: 12, nombre: "Auriculares de Casco (Vincha)", descripcion: "Auriculares Bluetooth con almohadillas acolchadas", marca: "Logitech", precio: 75000, stock: 20, garantia: 12, cat: 4, img: imagenesRespaldoWeb[12] },
  { id: 13, nombre: "Mouse Gamer RGB", descripcion: "Mouse óptico de alta precisión con cable", marca: "Logitech", precio: 80000, stock: 30, garantia: 12, cat: 4, img: imagenesRespaldoWeb[13] },
  { id: 14, nombre: "Mouse Bluetooth Ergonómico", descripcion: "Mouse inalámbrico silencioso para laptop", marca: "Logitech", precio: 38000, stock: 45, garantia: 12, cat: 4, img: imagenesRespaldoWeb[14] },
  { id: 15, nombre: "Cargador Carga Rápida 33W", descripcion: "Cargador de pared de alta velocidad Tipo-C", marca: "Xiaomi", precio: 35000, stock: 40, garantia: 6, cat: 5, img: imagenesRespaldoWeb[15] },
  { id: 16, nombre: "Funda Protectora Antigolpes", descripcion: "Funda de silicona reforzada en esquinas", marca: "Genérica", precio: 25000, stock: 50, garantia: 6, cat: 5, img: imagenesRespaldoWeb[16] },
  { id: 17, nombre: "Vidrio Templado 9D", descripcion: "Protector de pantalla ultra resistente anti-rayaduras", marca: "Genérica", precio: 8000, stock: 100, garantia: 3, cat: 5, img: imagenesRespaldoWeb[17] },
  { id: 18, nombre: "Tarjeta MicroSD 128GB", descripcion: "Almacenamiento de alta velocidad Clase 10 Ultra", marca: "SanDisk", precio: 22000, stock: 60, garantia: 12, cat: 5, img: imagenesRespaldoWeb[18] },
  { id: 19, nombre: "Bateria externa de 10000 mAh", descripcion: "Bateria portátil de carga rápida doble USB", marca: "Redmi", precio: 42000, stock: 30, garantia: 6, cat: 5, img: imagenesRespaldoWeb[19] }
];

let combos = [
  {
    id: 1,
    nombre: "Kit Redmi A3 Full Pack",
    descripcion: "¡Experiencia completa! Incluye Celular Redmi A3 + Cargador Rápido 33W + Funda + Vidrio Templado + MicroSD 128GB + Bateria externa de 10000 mAh.",
    precio: 980000,
    items: [{ p: 4, c: 1 }, { p: 15, c: 1 }, { p: 16, c: 1 }, { p: 17, c: 1 }, { p: 18, c: 1 }, { p: 19, c: 1 }]
  },
  {
    id: 2,
    nombre: "Kit Notebook Gamer Completo",
    descripcion: "Notebook Gamer + Cargador + Auriculares de Casco + Mouse Bluetooth inalámbrico con descuento.",
    precio: 1580000,
    items: [{ p: 1, c: 1 }, { p: 15, c: 1 }, { p: 12, c: 1 }, { p: 14, c: 1 }]
  }
];

let carrito = [];
let filtro = { cat: 0, texto: '', orden: '' };

try { carrito = JSON.parse(localStorage.getItem('carrito') || '[]'); } catch(e) { carrito = []; }
const guardar = () => { try { localStorage.setItem('carrito', JSON.stringify(carrito)); } catch(e) {} };

function toast(msg) {
  $('toast-msg').textContent = msg;
  bootstrap.Toast.getOrCreateInstance($('toast'), { delay: 3000 }).show();
}

async function cargarDatosBD() {
  try {
    const [resCat, resProd, resComb] = await Promise.all([
      fetch('/api/categorias'),
      fetch('/api/productos'),
      fetch('/api/combos')
    ]);

    if (resCat.ok && resProd.ok && resComb.ok) {
      const catsData = await resCat.json();
      const prodData = await resProd.json();
      const combData = await resComb.json();

      if (prodData.length > 0) {
        const iconos = ['fa-laptop', 'fa-mobile-screen', 'fa-desktop', 'fa-headphones', 'fa-plug'];
        categorias = {};
        catsData.forEach((c, i) => { categorias[c.id] = { n: c.nombre, i: iconos[i % iconos.length] }; });
        
        productos = prodData.map(pBD => {
          const esUrlWebValida = pBD.img && typeof pBD.img === 'string' && pBD.img.trim().startsWith('http');
          return {
            ...pBD,
            img: esUrlWebValida ? pBD.img.trim() : (imagenesRespaldoWeb[pBD.id] || "https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80")
          };
        });
        combos = combData;
      }
    }
  } catch(e) {
    console.log("Servidor MySQL no alcanzado, usando catálogo local.");
  } finally {
    renderFiltros();
    renderCarrito();
  }
}

function usado(pid) {
  return carrito.reduce((t, l) => {
    if (l.tipo === 'p') return t + (l.id === pid ? l.cantidad : 0);
    const c = combos.find(x => x.id === l.id);
    if (!c) return t;
    const it = c.items.find(i => i.p === pid);
    return t + (it ? it.c * l.cantidad : 0);
  }, 0);
}

function renderFiltros() {
  const lista = [[0, 'Todos'], ...Object.entries(categorias).map(([k, v]) => [+k, v.n])];
  $('filtros').innerHTML = lista.map(([id, n]) =>
    `<button class="chip ${filtro.cat === id ? 'active' : ''}" data-cat="${id}">${n}</button>`).join('');
}

function renderProductos() {
  let lista = productos.filter(p =>
    (!filtro.cat || p.cat === filtro.cat) &&
    (p.nombre + ' ' + p.marca + ' ' + p.descripcion).toLowerCase().includes(filtro.texto));
  
  if (filtro.orden === 'asc') lista.sort((a, b) => a.precio - b.precio);
  if (filtro.orden === 'desc') lista.sort((a, b) => b.precio - a.precio);
  if (filtro.orden === 'nombre') lista.sort((a, b) => a.nombre.localeCompare(b.nombre));

  $('sin-resultados').classList.toggle('d-none', lista.length > 0);
  $('lista-productos').innerHTML = lista.map(p => {
    const libre = p.stock - usado(p.id);
    const estado = p.stock === 0 ? ['stock-out', 'Sin stock'] : libre <= 0 ? ['stock-low', 'Agotado en carrito'] :
                   p.stock <= 10 ? ['stock-low', `¡Quedan ${libre} unidades!`] : ['stock-ok', 'En stock'];
    const catObj = categorias[p.cat] || { i: 'fa-box', n: 'Producto' };
    
    const esUrlWebValida = p.img && typeof p.img === 'string' && p.img.trim().startsWith('http');
    const rutaImg = esUrlWebValida ? p.img.trim() : (imagenesRespaldoWeb[p.id] || "https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80");

    return `<div class="col"><article class="product">
      <div class="thumb" aria-hidden="true">
        <img src="${rutaImg}" alt="${p.nombre}">
      </div>
      <div class="body">
        <span class="brand-tag">${p.marca} · ${catObj.n}</span>
        <h3 class="h5 mt-1">${p.nombre}</h3>
        <p class="text-secondary small mb-2">${p.descripcion}</p>
        <p class="small mb-3"><i class="fa-solid fa-shield-halved text-primary me-1"></i> Garantía de ${p.garantia} meses</p>
        <div class="mt-auto">
          <div class="price fs-4 mb-1">${money(p.precio)}</div>
          <p class="small fw-bold ${estado[0]} mb-3">${estado[1]}</p>
          <button class="btn btn-add w-100" data-add="p" data-id="${p.id}" ${libre <= 0 ? 'disabled' : ''}>
            <i class="fa-solid fa-cart-plus me-1"></i> Agregar al carrito</button>
        </div>
      </div></article></div>`;
  }).join('');
}

function renderCombos() {
  $('lista-combos').innerHTML = combos.map(c => {
    const suma = c.items.reduce((t, i) => {
      const producto = prod(i.p);
      return t + (producto ? producto.precio * i.c : 0);
    }, 0);
    const ahorro = suma - c.precio;
    const disponible = c.items.every(i => {
      const producto = prod(i.p);
      return producto ? (producto.stock - usado(i.p) >= i.c) : false;
    });

    return `<div class="col-lg-6"><div class="combo">
      <div class="d-flex justify-content-between align-items-start gap-2 mb-2">
        <h3 class="h4 mb-0">${c.nombre}</h3>
        ${ahorro > 0 ? `<span class="save">Ahorrás ${money(ahorro)}</span>` : ''}
      </div>
      <p class="text-secondary small mb-3">${c.descripcion}</p>
      <ul class="list-unstyled mb-4">${c.items.map(i => {
        const p = prod(i.p);
        if (!p) return '';
        const catObj = categorias[p.cat] || { i: 'fa-box' };
        return `<li><i class="fa-solid ${catObj.i || 'fa-box'} text-primary me-2"></i>${i.c} × ${p.nombre}</li>`;
      }).join('')}</ul>
      <div class="d-flex align-items-center justify-content-between pt-2 border-top">
        <div><div class="price fs-4">${money(c.precio)}</div>${ahorro > 0 ? `<small class="text-secondary text-decoration-line-through">${money(suma)}</small>` : ''}</div>
        <button class="btn btn-add px-4" data-add="c" data-id="${c.id}" ${disponible ? '' : 'disabled'}>Agregar combo</button>
      </div></div></div>`;
  }).join('');
}

function renderCarrito() {
  let total = 0, unidades = 0;
  if ($('items-carrito')) {
    $('items-carrito').innerHTML = carrito.length ? carrito.map((l, idx) => {
      total += l.precio * l.cantidad; unidades += l.cantidad;
      return `<div class="cart-line">
        <div><strong>${l.nombre}</strong><div class="small text-secondary">${money(l.precio)} c/u</div></div>
        <div class="price text-end">${money(l.precio * l.cantidad)}</div>
        <div class="qty"><button data-q="-1" data-i="${idx}" aria-label="Quitar uno">−</button><span>${l.cantidad}</span><button data-q="1" data-i="${idx}" aria-label="Agregar uno">+</button></div>
        <button class="btn btn-sm btn-link text-danger justify-self-end text-decoration-none" data-del="${idx}">Quitar</button></div>`;
    }).join('') : '<p class="text-secondary text-center mt-4">Tu carrito está vacío. Agregá productos del catálogo para empezar.</p>';
  }

  if ($('checkout-resumen-items')) {
    $('checkout-resumen-items').innerHTML = carrito.map(l => {
      let subitems = '';
      if (l.tipo === 'c') {
        const c = combos.find(x => x.id === l.id);
        if (c && c.items) {
          const lista = c.items.map(i => {
            const p = prod(i.p);
            return p ? `${i.c}× ${p.nombre}` : '';
          }).filter(Boolean).join(', ');
          subitems = `<div class="text-muted ms-2" style="font-size:0.78rem;">Incluye: ${lista}</div>`;
        }
      }
      return `<div class="mb-2">
        <div class="d-flex justify-content-between text-dark">
          <span>${l.cantidad}× <strong>${l.nombre}</strong></span>
          <span class="fw-semibold">${money(l.precio * l.cantidad)}</span>
        </div>
        ${subitems}
      </div>`;
    }).join('');
  }
  
  if ($('contador-carrito')) $('contador-carrito').textContent = unidades;
  if ($('total-carrito')) $('total-carrito').textContent = money(total);
  if ($('checkout-total')) $('checkout-total').textContent = money(total);
  if ($('btn-pagar')) $('btn-pagar').disabled = !carrito.length;
  if ($('btn-vaciar')) $('btn-vaciar').classList.toggle('d-none', !carrito.length);
  guardar(); renderProductos(); renderCombos();
}

function agregar(tipo, id) {
  const origen = tipo === 'p' ? prod(id) : combos.find(c => c.id === id);
  const existente = carrito.find(l => l.tipo === tipo && l.id === id);
  if (existente) existente.cantidad++;
  else carrito.push({ tipo, id, nombre: origen.nombre, precio: origen.precio, cantidad: 1 });
  
  const ok = productos.every(p => usado(p.id) <= p.stock);
  if (!ok) {
    if (existente) existente.cantidad--; else carrito.pop();
    toast('No hay más stock disponible de ese producto.'); return;
  }
  renderCarrito(); toast(origen.nombre + ' agregado al carrito');
}

function cambiarCantidad(idx, delta) {
  const l = carrito[idx];
  l.cantidad += delta;
  if (l.cantidad <= 0) { carrito.splice(idx, 1); }
  else if (!productos.every(p => usado(p.id) <= p.stock)) { l.cantidad -= delta; toast('No hay más stock disponible.'); }
  renderCarrito();
}

document.addEventListener('click', e => {
  const chip = e.target.closest('[data-cat]');
  if (chip) { filtro.cat = +chip.dataset.cat; renderFiltros(); renderProductos(); return; }
  const add = e.target.closest('[data-add]');
  if (add) return agregar(add.dataset.add, +add.dataset.id);
  const q = e.target.closest('[data-q]');
  if (q) return cambiarCantidad(+q.dataset.i, +q.dataset.q);
  const del = e.target.closest('[data-del]');
  if (del) { carrito.splice(+del.dataset.del, 1); renderCarrito(); }
});

$('buscador').addEventListener('input', e => { filtro.texto = e.target.value.trim().toLowerCase(); renderProductos(); });
$('orden').addEventListener('change', e => { filtro.orden = e.target.value; renderProductos(); });
$('btn-vaciar').addEventListener('click', () => { carrito = []; renderCarrito(); });

$('btn-pagar').addEventListener('click', () => {
  if (!$('checkout-total')) {
    $('checkout-cuerpo').innerHTML = checkoutCuerpoInicial;
    $('checkout-footer').innerHTML = checkoutFooterInicial;
    $('form-checkout').classList.remove('was-validated');
    renderCarrito();
  }
});

$('form-checkout').addEventListener('submit', async e => {
  e.preventDefault();
  const form = e.target;
  if (!form.checkValidity()) { form.classList.add('was-validated'); toast('Completá todos los campos para continuar.'); return; }

  const btnConfirmar = $('btn-confirmar-compra');
  if (btnConfirmar) {
    btnConfirmar.disabled = true;
    btnConfirmar.innerHTML = '<span class="spinner-border spinner-border-sm me-2"></span>Procesando...';
  }

  const total = carrito.reduce((t, l) => t + l.precio * l.cantidad, 0);
  const emailCliente = $('f-email').value.trim();
  const ventaPayload = {
    cliente: { nombre: $('f-nombre').value.trim(), apellido: $('f-apellido').value.trim(), email: emailCliente },
    total: total,
    detalle: carrito.map(l => ({ tipo: l.tipo, id: l.id, nombre: l.nombre, cantidad: l.cantidad, precio_unitario: l.precio })),
    pago: { metodo: $('f-metodo').value },
    envio: { direccion_envio: $('f-direccion').value.trim() }
  };

  try {
    const res = await fetch('/api/ventas', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(ventaPayload)
    });
    const resultado = await res.json();
    
    if (res.ok && resultado.success) {
      const listaConfirmada = (resultado.detalle || []).map(d =>
        `<li class="d-flex justify-content-between py-1 border-bottom">
          <span>${d.cantidad}× ${d.nombre}</span>
          <strong>${money(d.subtotal)}</strong>
        </li>`
      ).join('');

      $('checkout-cuerpo').innerHTML = `<div class="py-2">
        <div class="text-center mb-3">
          <i class="fa-solid fa-circle-check fs-1 text-success mb-2"></i>
          <h4>¡Gracias por tu compra!</h4>
          <p class="mb-1">Pedido <strong>#${resultado.id_venta}</strong> · Seguimiento: <strong>${resultado.numero_seguimiento}</strong></p>
          <p class="text-secondary small mb-0">${resultado.email_enviado ? `Comprobante enviado a <strong>${emailCliente}</strong>` : `Registrado a nombre de <strong>${emailCliente}</strong>`}</p>
        </div>
        <div class="bg-light rounded p-3 small">
          <div class="fw-bold mb-2">Detalle confirmado:</div>
          <ul class="list-unstyled mb-2">${listaConfirmada}</ul>
          <div class="d-flex justify-content-between fs-6 pt-1">
            <span class="fw-bold">Total pagado:</span>
            <span class="fw-bold text-success">${money(total)}</span>
          </div>
        </div>
      </div>`;
      $('checkout-footer').innerHTML = '<button type="button" class="btn btn-add px-4" data-bs-dismiss="modal">Seguir comprando</button>';
      carrito = [];
      renderCarrito();
      cargarDatosBD();
    } else {
      throw new Error(resultado.error || 'Error al registrar la venta en el servidor');
    }
  } catch(err) {
    toast('Error: ' + err.message);
    if (btnConfirmar) {
      btnConfirmar.disabled = false;
      btnConfirmar.innerHTML = 'Confirmar compra';
    }
  }
});

cargarDatosBD();
</script>
</body>
</html>