<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600;700;800&family=Open+Sans:wght@400;600&display=swap" rel="stylesheet">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
    /* --- VIBRANT THEME VARIABLES --- */
    :root {
        /* Nền chuyển từ xanh than sang đen -> Có chiều sâu hơn */
        --bg-body: #0f172a; 
        --bg-card: #1e293b;
        
        /* Màu Neon điểm nhấn */
        --neon-orange: #ff6b6b;
        --neon-purple: #7c4dff;
        --text-glow: 0 0 10px rgba(255, 107, 107, 0.5);
    }

    body {
        background-color: var(--bg-body);
        color: #f1f5f9; /* Trắng đục cho đỡ mỏi mắt */
        font-family: 'Open Sans', sans-serif;
        /* Hình nền vân nhẹ để bớt đơn điệu */
        background-image: radial-gradient(circle at 10% 20%, rgba(124, 77, 255, 0.1) 0%, transparent 20%),
                          radial-gradient(circle at 90% 80%, rgba(255, 107, 107, 0.1) 0%, transparent 20%);
    }

    /* --- TYPOGRAPHY --- */
    h1, h2, h3, .navbar-brand, .card-title {
        font-family: 'Montserrat', sans-serif;
    }
    
    /* Chữ Gradient (7 màu) cho tiêu đề nổi bật */
    .text-gradient {
        background: linear-gradient(to right, #ff6b6b, #f06595, #cc5de8);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        font-weight: 800;
    }

    /* --- NAVBAR --- */
    .navbar-custom {
        background: rgba(15, 23, 42, 0.85); /* Kính mờ */
        backdrop-filter: blur(10px);
        border-bottom: 1px solid rgba(255,255,255,0.1);
    }
    
    .navbar-brand {
        font-weight: 800;
        letter-spacing: 1px;
        font-size: 1.8rem;
    }

    .nav-link {
        font-weight: 600;
        color: #cbd5e1 !important;
        transition: 0.3s;
    }
    .nav-link:hover {
        color: var(--neon-orange) !important;
        text-shadow: var(--text-glow);
    }

    /* --- MOVIE CARD (SÁNG HƠN) --- */
    .movie-card {
        background: var(--bg-card);
        border-radius: 12px;
        overflow: hidden;
        transition: all 0.3s ease;
        border: 1px solid rgba(255,255,255,0.05);
        position: relative;
    }

    /* Hover vào card sẽ sáng rực lên */
    .movie-card:hover {
        transform: translateY(-10px);
        box-shadow: 0 10px 30px rgba(124, 77, 255, 0.3); /* Bóng màu tím */
        border-color: var(--neon-purple);
    }

    .poster-frame {
        height: 280px; /* Cố định chiều cao */
        overflow: hidden;
        position: relative;
    }

    .poster-frame img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        transition: transform 0.5s ease;
    }

    .movie-card:hover .poster-frame img {
        transform: scale(1.1);
    }

    /* Nút Play bay lên khi hover */
    .card-overlay {
        position: absolute;
        bottom: -50px; right: 10px;
        transition: 0.3s;
        opacity: 0;
    }
    .movie-card:hover .card-overlay {
        bottom: 10px;
        opacity: 1;
    }

    /* --- BUTTONS --- */
    .btn-gradient {
        background: linear-gradient(45deg, #ff6b6b, #ee5253);
        border: none;
        color: white;
        font-weight: 700;
        box-shadow: 0 4px 15px rgba(255, 107, 107, 0.4);
    }
    .btn-gradient:hover {
        background: linear-gradient(45deg, #ee5253, #ff9f43);
        color: white;
        transform: scale(1.05);
    }

    /* --- FOOTER --- */
    footer {
        background: #0b1120;
        border-top: 1px solid rgba(255,255,255,0.1);
        color: #94a3b8;
        margin-top: auto;
        padding: 2rem 0;
    }
</style>